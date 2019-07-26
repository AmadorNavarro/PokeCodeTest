//
//  BaseEntityDataMapper.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

/** Class that implement the Protocol to transform the classes.
    - parameters:
        - T: The parameter type out for the class
        - E: The parameter type in for the class
    */
class BaseModelDataMapper<T,E>: BaseGenericDataMapper {
    
    typealias InData = E
    typealias OutData = T
    
}

