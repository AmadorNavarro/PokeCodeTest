//
//  UINavigationBar+Utilities.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 06/12/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

public protocol NavigationBarStylized: Stylized {
    
}

extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
    public func setup(with style: Stylized) {
        guard let style = style as? NavigationBarStylized else { return }
        
        view.backgroundColor = style.backgroundColor
        let navigationBar = self.navigationBar
        UINavigationBar.appearance().isTranslucent = false
        navigationBar.barTintColor = style.backgroundColor
        navigationBar.tintColor = style.textColor
        navigationBar.titleTextAttributes = [.font : style.font, .foregroundColor : style.textColor]
    }
    
}

