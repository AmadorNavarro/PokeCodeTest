//
//  UpperBannerView.swift
//  PokeCodeTest
//
//  Created by Amador Navarro Lucas on 14/04/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class UpperBannerView: BaseComponentView, BaseComponentDelegate {
    
    fileprivate enum AnimationState {
        
        case idle, gravity, impulse
        
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    public static let preferredHeight: CGFloat = 100.0
    fileprivate var animator: UIDynamicAnimator? = nil
    private var gravity: UIGravityBehavior? = nil
    private var elasticity: UIDynamicItemBehavior? = nil
    private var push: UIPushBehavior? = nil
    fileprivate var timer: Timer? = nil
    fileprivate var animationState = AnimationState.idle
    var viewModel = UpperBannerViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        setupRx()
        setupLayout()
    }
    
    // MARK: - Setup
    func setupRx() {
        disposeBag = DisposeBag()

        viewModel.text.bind(to: textLabel.rx.text).disposed(by: disposeBag)
        viewModel.backgroundColor.asObservable().bind { [weak self] color in
            self?.view.backgroundColor = color
            }.disposed(by: disposeBag)
        
        viewModel.font.asObservable().bind { [weak self] font in
            self?.textLabel.font = font
            }.disposed(by: disposeBag)
        
        viewModel.textColor.asObservable().bind { [weak self] color in
            self?.textLabel.textColor = color
            }.disposed(by: disposeBag)
    }
    
    internal func setupLayout() {
        view.frame = CGRect(x: 0, y: 0, width: bounds.width, height: UpperBannerView.preferredHeight)
        
    }
    
    // MARK: - Animation
    func startAnimation() {
        animationState = .gravity
        animator = UIDynamicAnimator(referenceView: self)
        animator?.delegate = self
        let gravity = UIGravityBehavior(items: [view])
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
        self.gravity = gravity
        animator?.addBehavior(gravity)
        
        let collisionBehaviour = UICollisionBehavior(items: [view])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collisionBehaviour)
        
        let elasticity = UIDynamicItemBehavior(items: [view])
        elasticity.elasticity = 0.7
        self.elasticity = elasticity
        animator?.addBehavior(elasticity)
        
        let push = UIPushBehavior(items: [view], mode: .instantaneous)
        push.magnitude = 0.0
        push.angle = 0.0
        self.push = push
        animator?.addBehavior(push)
    }
    
    func impulseBannerView() {
        animationState = .impulse
        let duration = 0.2
        let oldOrigin = self.view.frame.origin
        let newOrigin = CGPoint(x: oldOrigin.x, y: oldOrigin.y - 20.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.frame.origin = newOrigin
        }) { completed in
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.frame.origin = oldOrigin
            }) { completed in
                self.hideBannerView()
            }
        }
    }
    
    func hideBannerView() {
        animationState = .idle
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.frame.origin = .zero
        }) { completion in
            self.finishAnimation()
        }
    }
    
    func finishAnimation() {
        self.removeFromSuperview()
    }

}

extension UpperBannerView: UIDynamicAnimatorDelegate {
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { [weak self] time in
            self?.animator?.removeAllBehaviors()
            self?.impulseBannerView()
        })
    }
    
}
