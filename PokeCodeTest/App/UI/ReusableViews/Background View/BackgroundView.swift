//
//  BackgroundView.swift
//  O-Results
//
//  Created by Amador Navarro Lucas on 19/01/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class BackgroundView: BaseComponentView, BaseComponentDelegate {
    
    private let cornerRadius: CGFloat = 30.0
    var viewModel = BackgroundViewModel()
    
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

        
    }
    
    internal func setupLayout() {
        backgroundColor = ThemeColor.ultraLightGray.color().withAlphaComponent(0.9)
        layer.cornerRadius = cornerRadius
    }

}
