//
//  UIButton+Utilities.swift
//  dammDetallistas
//
//  Created by RUBEN CATALAN on 22/12/16.
//  Copyright © 2016 BeRepublic. All rights reserved.
//

import UIKit

public protocol ButtonStylized: Stylized {
    
    var highlightTextColor: UIColor? { get set }
    var selectedColor: UIColor? { get set }
    var borderColor: UIColor? { get set }
    var borderWidth: CGFloat { get set }
    var cornerRadius: CGFloat { get set }
    var image: UIImage? { get set }
    var isLink: Bool { get set }
}

extension UIButton {
    
    public func setup(withStyle style: Stylized) {
        guard let style = style as? ButtonStylized else { return }
        
        titleLabel?.font = style.font
        setTitleColor(style.textColor, for: .normal)
        if let highlightedColor = style.highlightTextColor {
            setTitleColor(highlightedColor, for: .highlighted)
        }
        if let selectedColor = style.selectedColor {
            setTitleColor(selectedColor, for: .selected)
        }
        
        if let image = style.image {
            let themeImage = image
            setImage(image.fillAlpha(fillColor: style.textColor), for: .normal)
            if let highlightedColor = style.highlightTextColor {
                setImage(themeImage.fillAlpha(fillColor: highlightedColor), for: .highlighted)
            }
            if let selectedColor = style.selectedColor {
                setImage(themeImage.fillAlpha(fillColor: selectedColor), for: .selected)
            }
        }
    }
    
    public func setupBorder(withStyle style: ButtonStylized) {
        setup(withStyle: style)
        
        if let borderColor = style.borderColor {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = style.borderWidth
            layer.cornerRadius = style.cornerRadius
        }
    }
    
    public func setupWithBackgroundColorRounded(withStyle style: ButtonStylized) {
        titleLabel?.font = style.font
        setTitleColor(style.textColor, for: .normal)
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius
        layer.masksToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
        
        if let highlightedColor = style.highlightTextColor {
            setTitleColor(highlightedColor, for: .highlighted)
        }
    }

}
