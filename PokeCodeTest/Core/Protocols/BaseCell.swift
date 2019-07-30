//
//  BaseCell.swift
//  OnionArchitecture
//
//  Created by Gary  Dos Santos on 09/08/2017.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit

protocol BaseCell {
    
    func set(viewModel: Any)
    
    static func registerIn(tableView: UITableView, nibName: String, cellIdentifier: String, cellClass: AnyClass)
    
    static func preferredNibName() -> String
    
}

extension BaseCell {
    
    static func registerIn(tableView: UITableView, nibName: String, cellIdentifier: String, cellClass: AnyClass) {
        if !nibName.isEmpty {
            tableView.register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        } else {
            tableView.register(cellClass, forCellReuseIdentifier: cellIdentifier)
        }
    }
    
    static func preferredNibName() -> String {
        return ""
    }
    
}

