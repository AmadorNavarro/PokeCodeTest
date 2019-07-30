//
//  UITableView+Utilities.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 08/12/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

public protocol TableViewStylized: Stylized {
    
    var separatorStyle: UITableViewCell.SeparatorStyle { get set }
    
}

extension UITableView {
    
    public func setup(with style: Stylized) {
        guard let style = style as? TableViewStylized else { return }
        
        self.separatorStyle = style.separatorStyle
        self.backgroundColor = style.backgroundColor
        
    }

}
