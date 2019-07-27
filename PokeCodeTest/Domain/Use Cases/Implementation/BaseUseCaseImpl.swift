//
//  BaseUseCaseImpl.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

/** Base class to initialize the repository
    - parameters:
        - T: The parameter type of the repository
    */
class BaseUseCaseImpl<T> {
    
    internal let repository: T
    
    init(repository: T) {
        self.repository = repository
    }
    
}
