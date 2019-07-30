//
//  Theme.swift
//  Seat
//
//  Created by Enrique Canedo on 25/8/17.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit

struct ButtonStyle: ButtonStylized {
    
    var font = ThemeFont.regular_14.font()
    var textColor = ThemeColor.white.color()
    var highlightTextColor: UIColor? = nil
    var selectedColor: UIColor? = nil
    var borderColor: UIColor? = nil
    var alignment = NSTextAlignment.center
    var backgroundColor = ThemeColor.mainOrange.color()
    var borderWidth: CGFloat = 0.0
    var cornerRadius: CGFloat = 5.0
    var image: UIImage? = nil
    var placeholderColor: UIColor? = nil
    var placeholderFont: UIFont? = nil
    var isLink = false
    var isSecure = false
    
    func textColor(_ textColor: ThemeColor) -> ButtonStyle {
        var copy = self
        copy.textColor = textColor.color()
        return copy
    }
    
    func align(_ align: NSTextAlignment) -> ButtonStyle {
        var copy = self
        copy.alignment = align
        return copy
    }
    
    func image(_ image: UIImage) -> ButtonStyle {
        var copy = self
        copy.image = image
        return copy
    }
    
    func isSecure(_ isSecure: Bool) -> ButtonStyle {
        var copy = self
        copy.isSecure = isSecure
        return copy
    }
    
    func font(_ font: ThemeFont) -> ButtonStyle {
        var copy = self
        copy.font = font.font()
        return copy
    }
    
    func backgroundColor(_ backgroundColor: ThemeColor) -> ButtonStyle {
        var copy = self
        copy.backgroundColor = backgroundColor.color()
        return copy
    }
    
    func borderColor(_ borderColor: ThemeColor) -> ButtonStyle {
        var copy = self
        copy.borderColor = borderColor.color()
        return copy
    }
    
}

struct NavigationBarStyle: NavigationBarStylized {
    
    var font = ThemeFont.bold_36.font()
    var textColor = ThemeColor.white.color()
    var alignment = NSTextAlignment.center
    var backgroundColor = ThemeColor.mainOrange.color()
    
}

struct LabelStyle: LabelStylized {
    
    var font = ThemeFont.regular_14.font()
    var textColor = ThemeColor.black.color()
    var alignment = NSTextAlignment.center
    var backgroundColor = ThemeColor.clear.color()
    
    func updateFont(_ font: ThemeFont) -> LabelStyle {
        var copy = self
        copy.font = font.font()
        return copy
    }
    
    func textColor(_ textColor: ThemeColor) -> LabelStyle {
        var copy = self
        copy.textColor = textColor.color()
        return copy
    }
    
    func alignment(_ align: NSTextAlignment) -> LabelStyle {
        var copy = self
        copy.alignment = align
        return copy
    }
    
    func backgroundColor(_ backgroundColor: ThemeColor) -> LabelStyle {
        var copy = self
        copy.backgroundColor = backgroundColor.color()
        return copy
    }
    
}

public struct TableViewStyle: TableViewStylized {
    
    public var separatorStyle = UITableViewCell.SeparatorStyle.singleLine
    public var font = ThemeFont.regular_14.font()
    public var textColor = ThemeColor.black.color()
    public var alignment = NSTextAlignment.natural
    public var backgroundColor = ThemeColor.lightGray.color()
    
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> TableViewStyle {
        var copy = self
        copy.separatorStyle = separatorStyle
        return copy
    }
    
    func font(_ font: ThemeFont) -> TableViewStyle {
        var copy = self
        copy.font = font.font()
        return copy
    }
    
    func textColor(_ textColor: ThemeColor) -> TableViewStyle {
        var copy = self
        copy.textColor = textColor.color()
        return copy
    }
    
    func alignment(_ align: NSTextAlignment) -> TableViewStyle {
        var copy = self
        copy.alignment = align
        return copy
    }
    
    func backgroundColor(_ backgroundColor: ThemeColor) -> TableViewStyle {
        var copy = self
        copy.backgroundColor = backgroundColor.color()
        return copy
    }
    
}

/// Base Theme Style for the App
enum ThemeStyle {
    
    case navigationBarStyle, headerText, rowText, textB16, textR14, textR16, placeCup, placeBadge, boldTitle, textB16White, standartButton
    
    func style() -> Stylized {
        switch self {
        case .navigationBarStyle:
            return NavigationBarStyle()
        case .headerText:
            return LabelStyle().textColor(.white).updateFont(.bold_18)
        case .rowText:
            return LabelStyle().updateFont(.bold_15)
        case .textB16:
            return LabelStyle().updateFont(.bold_16)
        case .textR16:
            return LabelStyle().updateFont(.regular_16)
        case .textR14:
            return LabelStyle().updateFont(.regular_14)
        case .placeCup:
            return LabelStyle().updateFont(.black_30).textColor(.mainOrange)
        case .placeBadge:
            return LabelStyle().updateFont(.bold_25).textColor(.mainOrange)
        case .boldTitle:
            return LabelStyle().updateFont(.bold_20)
        case .textB16White:
            return LabelStyle().textColor(.white).updateFont(.bold_16)
        case .standartButton:
            return ButtonStyle()
        }
    }
    
}

enum ThemeColor {
    
    case mainOrange, lightOrange, gray, lightGray, ultraLightGray, white, clear, black, magent
    
    func color() -> UIColor {
            switch self {
            case .mainOrange:
                return UIColor.rgbColor(red: 245, green: 109, blue: 48)
            case .lightOrange:
                return UIColor.rgbColor(red: 227, green: 149, blue: 113)
            case .gray:
                return UIColor.rgbColor(red: 200, green: 200, blue: 200)
            case .lightGray:
                return UIColor.rgbColor(red: 220, green: 220, blue: 220)
            case .ultraLightGray:
                return UIColor.rgbColor(red: 235, green: 235, blue: 235)
            case .white:
                return UIColor.white
            case .clear:
                return UIColor.clear
            case .black:
                return UIColor.black
            case .magent:
                return UIColor.rgbColor(red: 205, green: 71, blue: 162)
            }
    }
    
    func cgColor() -> CGColor {
        return color().cgColor
    }
    
}

enum ThemeFont {
    
    case black_30, black_14, regular_14, bold_15, regular_15, bold_16, bold_18, bold_20, bold_25, black_24, bold_13, bold_10, bold_36, bold_11, bold_8, regular_13, regular_16
    
    func font() -> UIFont {
        let regularFont = "Roboto-Regular"
        let boldFont = "Roboto-Bold"
        let blackFont = "Roboto-Black"
        
        switch self {
        case .bold_8:
            return safe(font: UIFont(name: boldFont, size: 8))
        case .bold_10:
            return safe(font: UIFont(name: boldFont, size: 10))
        case .bold_11:
            return safe(font: UIFont(name: boldFont, size: 11))
        case .regular_13:
            return safe(font: UIFont(name: regularFont, size: 13))
        case .bold_13:
            return safe(font: UIFont(name: boldFont, size: 13))
        case .black_30:
            return safe(font: UIFont(name: blackFont, size: 30))
        case .black_14:
            return safe(font: UIFont(name: blackFont, size: 14))
        case .regular_14:
            return safe(font: UIFont(name: regularFont, size: 14))
        case .regular_16:
            return safe(font: UIFont(name: regularFont, size: 16))
        case .bold_15:
            return safe(font: UIFont(name: boldFont, size: 15))
        case .regular_15:
            return safe(font: UIFont(name: regularFont, size: 15))
        case .bold_16:
            return safe(font: UIFont(name: boldFont, size: 16))
        case .bold_18:
            return safe(font: UIFont(name: boldFont, size: 18))
        case .bold_20:
            return safe(font: UIFont(name: boldFont, size: 20))
        case .bold_25:
            return safe(font: UIFont(name: boldFont, size: 25))
        case .black_24:
            return safe(font: UIFont(name: blackFont, size:24))
        case .bold_36:
            return safe(font: UIFont(name: boldFont, size:36))
        }
    }
    
    // Helper method to unwrap the UIFont
    func safe(font: UIFont?) -> UIFont {
//        if let font = font {
//            return font
//        } else {
            return font ?? .systemFont(ofSize: 12.0)
//        }
    }
    
}

enum ThemeImage {
    
    case cup, badge, controlPoint, runner0, runner1, runner2, runner3
    
    func image() -> UIImage {
        var imageName = ""
        
        switch self {
        case .cup:
            imageName = "cup"
        case .badge:
            imageName = "badge"
        case .controlPoint:
            imageName = "ControlPoint"
        case .runner0:
            imageName = "Runner0"
        case .runner1:
            imageName = "Runner1"
        case .runner2:
            imageName = "Runner2"
        case .runner3:
            imageName = "Runner3"
        }
        
        return imageWithImageName(imageName)
    }
    
    /// Return the image for a given imageName and dictionary with options
    /// - parameters:
    ///     - imageName : The name of the fiven image.
    /// - returns: UIImage
    private func imageWithImageName(_ imageName:String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage()
        }
        
        return image
    }
    
}
