//
//  UIView+utilities.swift
//  O-Results
//
//  Created by Amador Navarro on 17/12/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = ThemeColor.black.cgColor()
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 10.0
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func maskByRoundingCorners(_ masks:UIRectCorner, withRadii radii:CGSize = Constants.cornerRadii, shadow: Bool = false) {
        let rounded = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: masks, cornerRadii: radii)
        
        let shape = CAShapeLayer()
        shape.path = rounded.cgPath
        
        layer.mask = shape
        layer.setNeedsLayout()
        if shadow {
            layer.masksToBounds = false
            layer.shadowColor = ThemeColor.black.cgColor()
            layer.shadowOpacity = 1.0
            layer.shadowOffset = CGSize(width: -5, height: 5)
            layer.shadowRadius = 10.0
            
            layer.shadowPath = rounded.cgPath
            layer.shouldRasterize = true
        }
    }
    
}
