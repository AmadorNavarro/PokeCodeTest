//
//  BaseViewController.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift
import Action
import SnapKit

class BaseViewController<VM: BaseViewModel>: UIViewController, BaseViewControllerDelegate {
    
    var viewModel: VM!
    var scrollView: UIScrollView!
    var disposeBag = DisposeBag()
    var contentView: UIView? = nil
    var bannerView: UpperBannerView? = nil
    var backgroundMessageView: UIView? = nil
    var bannerTopConstraint: ConstraintMakerEditable? = nil
    
    #if DEBUG
    var showJSONLoggerGesture = UITapGestureRecognizer()
    #endif
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel = createViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupLayout()
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.onViewWillAppear()
        setupTitle()
        
        if scrollView != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        setupGestures()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        resetTitle()
        removeGestures()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if scrollView != nil {
            scrollView.setContentOffset(.zero, animated: false)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupViewModel() {
        viewModel.setup(withPresenter: self)
    }
    
    func setupRx() {
        disposeBag = DisposeBag()
        
        viewModel.actionError.elements.subscribe(onNext: { [weak self] error in
            self?.manageActionError(error: error)
        }).disposed(by: disposeBag)
        
        viewModel.showLoadingAction.elements.subscribe(onNext: { [weak self] visibility in
            self?.progressVisibility(visibility: visibility)
        }).disposed(by: disposeBag)
        
        viewModel.notInternetConnection.onExecute { [weak self] in
            self?.showLostconnectionMessage()
        }.disposed(by: disposeBag)
    }
    
    func setupLayout() {
        edgesForExtendedLayout = .bottom
    }
    
    func setupGestures() {
        #if DEBUG
        // Show JSONLogger information
        showJSONLoggerGesture = UITapGestureRecognizer(target: self, action: #selector(showJSONLogger))
        showJSONLoggerGesture.numberOfTapsRequired = 3
        navigationController?.view.addGestureRecognizer(showJSONLoggerGesture)
        #endif
    }
    
    /// Override and return a presenter in a subclass.
    func createViewModel() -> VM {
        preconditionFailure("VMMV method `createViewModel()` must be override in a subclass and do not call `super.createViewModel()`!")
    }
    
    /// Override this method to initialize the Navigation Bar Title
    func navBarTitle() -> String {
        return ""
    }
    
    /// Override this method to initialize the Navigation Bar Title and hide the Navigation Bar if the title isEmpty otherwise show it
    func setupTitle() {
        title = navBarTitle()
        navigationController?.isNavigationBarHidden = title?.isEmpty ?? true
    }
    
    /// Add a map in the background
    func addMapBackgroundImage() {
        let backgroundImage = UIImageView.mapImage()
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        backgroundImage.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue, let scrollView = scrollView else { return }
        
        let keyboardFrame = value.cgRectValue
        let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom = adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom = adjustmentHeight
    }
    
    private func resetTitle() {
        title = ""
    }
    
    private func removeGestures() {
        #if DEBUG
        navigationController?.view.removeGestureRecognizer(showJSONLoggerGesture)
        #endif
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        adjustInsetForKeyboardShow(show: true, notification: notification)
    }
    
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        adjustInsetForKeyboardShow(show: false, notification: notification)
    }
    
    internal func manageActionError(error: APINetworkError, notNetworkAvailableAction: UIAlertAction? = nil) {
        if self.viewModel.isNetworkAvailable() {
            self.showAlert(error: error)
        } else {
            self.showAlertController(title: "PokeCodeTest_error_message_unexcepted_error_title".localized, message: "PokeCodeTest_error_message_unexcepted_error_message".localized, buttonAction: notNetworkAvailableAction)
        }
    }
    
    @objc private func showJSONLogger() {
        if let text = JSONLogger.requestJSON() {
            showAlertController(message: text)
        }
    }
    
    internal func showBackgroundView(message: String = "") {
        guard backgroundMessageView == nil && viewModel.state == .loaded else { return }
        
        let backgroundView = BackgroundView()
        let messageLabel = UILabel(frame: .zero)
        messageLabel.textAlignment = .center
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        if let style = ThemeStyle.boldTitle.style() as? LabelStylized {
            messageLabel.setup(withStyle: style)
        }
        
        backgroundView.addSubview(messageLabel)
        messageLabel.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20))
        }
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.greaterThanOrEqualTo(view).offset(40)
            make.trailing.greaterThanOrEqualTo(view).offset(40)
        }
        backgroundMessageView = backgroundView
    }
    
    internal func hideBackgroundView() {
        backgroundMessageView?.removeFromSuperview()
        backgroundMessageView = nil
    }
    
    internal func showLostconnectionMessage(seconds: TimeInterval = 10) {
        addLostConnectionMessage()
        bannerView?.startAnimation()
    }
    
    private func addLostConnectionMessage() {
        guard let navigation = navigationController?.view else { return }
        let bannerView = lostConnectionBannerView()
        navigation.addSubview(bannerView)
    }
    
    private func lostConnectionBannerView() -> UpperBannerView {
        if let bannerView = self.bannerView {
            return bannerView
        } else {
            let barHeight = navigationController?.navigationBar.frame.maxY ?? 0
            let frame = CGRect(x: 0, y: -UpperBannerView.preferredHeight, width: UIScreen.main.bounds.width, height: UpperBannerView.preferredHeight + barHeight)
            let bannerView = UpperBannerView(frame: frame)
            bannerView.viewModel.setUp(text: "PokeCodeTest_reachability_error_message_text".localized, textStyle: .textB16White, backgroundColor: .red)
            self.bannerView = bannerView
            return bannerView
        }
    }
    
}
