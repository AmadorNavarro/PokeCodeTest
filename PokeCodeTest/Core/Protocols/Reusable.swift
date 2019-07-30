//
//  Reusable.swift
//  OnionArchitecture
//
//  Created by Gary  Dos Santos on 09/08/2017.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit

protocol Reusable {
    
    static var reuseIdentifier: String { get }
    
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
}

