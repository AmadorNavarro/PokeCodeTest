//
//  PullToRefreshViewController.swift
//  O-Results
//
//  Created by Amador Navarro on 03/03/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

class PullToRefreshViewController<VM: BaseViewModel>: BaseViewController<VM>, UIScrollViewDelegate {
    
    internal let pullToRefreshView = PullToRefreshView(frame: .zero)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pullToRefreshView.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 0.0)
        pullToRefreshView.backgroundColor = ThemeColor.clear.color()
    }
    
    override func setupRx() {
        super.setupRx()
        
        pullToRefreshView.viewModel.state.asObservable().subscribe(onNext: { [weak self] state in
            guard let `self` = self else { return }
            switch state {
            case .loading:
                self.pullToRefreshTiggered()
            case .loaded:
                self.pullToRefreshView.endRunnerAnimation()
            case .ending:
                self.closePullToRefresh()
            default:
                break
            }
        }).disposed(by: disposeBag)
    }
    
    public func pullToRefreshTiggered() {
        
    }
    
    func loadEnding() {
        pullToRefreshView.state(.loaded)
    }
    
    public func closePullToRefresh() {
        var inset = scrollView.contentInset
        inset.top = 0.0
        let offset = CGPoint.zero
        
        UIView.animate(withDuration: Constants.shortAnimationTime, animations: { [weak self] in
            self?.scrollView.contentInset = inset
            self?.scrollView.contentOffset = offset
        }) { [weak self] finish in
            self?.pullToRefreshView.state(.idle)
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y < 0 && pullToRefreshView.state() == .idle else { return }
        self.scrollView = scrollView
        let offset = scrollView.contentOffset.y + scrollView.contentInset.top
        pullToRefreshView.scrollViewDidScroll(offset: -offset)
        scrollView.setNeedsDisplay()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if pullToRefreshView.isEnoughToTiggerAction() {
            if viewModel.reachability == .notReachable {
                viewModel.notInternetConnection.execute(())
                return
            }
            pullToRefreshView.scrollViewEndScroll()
            var inset = scrollView.contentInset
            inset.top = pullToRefreshView.tiggerHeight
            let offset = scrollView.contentOffset
            
            UIView.animate(withDuration: Constants.shortAnimationTime) {
                scrollView.contentInset = inset
                scrollView.contentOffset = offset
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if pullToRefreshView.state() == .waiting {
            pullToRefreshView.startLoading()
        }
    }
    
    func searchBarHeight() -> CGFloat {
        return 0
    }
    
}
