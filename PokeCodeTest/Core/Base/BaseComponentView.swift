//
//  BaseComponentView.swift
//  Seat
//
//  Created by Gary  Dos Santos on 29/08/2017.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit
import RxSwift

protocol BaseComponentDelegate {
    
    func setupLayout()
    
    func setupRx()
    
}

class BaseComponentView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = ThemeColor.clear.color()
        
        view = loadViewFromNib()
        view.backgroundColor = ThemeColor.clear.color()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        
        return nibView ?? UIView(frame: .zero)
    }
    
}
