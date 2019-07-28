//
//  UILabel+Utilities.swift
//  PokeCodeTest
//
//  Created by Amador Navarro Lucas on 09/12/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

public protocol LabelStylized: Stylized {
    
}

extension UILabel {
    
    public func setup(withStyle style: LabelStylized) {
        font = style.font
        textColor = style.textColor
        backgroundColor = style.backgroundColor
    }
    
}
