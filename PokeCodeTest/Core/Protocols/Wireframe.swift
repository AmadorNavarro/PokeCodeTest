//
//  Wireframe.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

protocol WireFrame {
    
    associatedtype PresenterController
    
    func setup(withPresenter presenter: PresenterController)
    
}
