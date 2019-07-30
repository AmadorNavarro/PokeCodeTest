//
//  BaseViewControllerDelegate.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

protocol BaseViewControllerDelegate {
        
    func setupLayout()
    func setupRx()
    func setupViewModel()
    
}
