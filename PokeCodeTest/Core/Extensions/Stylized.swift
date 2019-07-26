//
//  Stylized.swift
//  Extensions
//
//  Created by BeRepublic on 03/04/2017.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit

public protocol Stylized {
    
    var font: UIFont { get set }
    var textColor: UIColor { get set }
    var alignment: NSTextAlignment { get set }
    var backgroundColor: UIColor { get set }
    
}
