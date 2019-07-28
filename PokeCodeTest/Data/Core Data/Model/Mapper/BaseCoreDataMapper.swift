//
//  BaseCoreDataMapper.swift
//  O-Results
//
//  Created by Amador Navarro on 02/09/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

/** Class that implement the Protocol to transform the classes.
 - parameters:
 - T: The parameter type out for the class
 - E: The parameter type in for the class
 */
class BaseCoreDataMapper<T,E>: BaseGenericDataMapper {
    
    typealias InData = E
    typealias OutData = T
    
}
