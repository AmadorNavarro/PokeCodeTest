//
//  JSONEncoder + Utils.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

extension JSONEncoder {
    
    convenience init(keyStrategy: KeyCodableStrategy) {
        self.init()
        
        switch keyStrategy {
        case .camelCase:
            keyEncodingStrategy = .useDefaultKeys
        case .snake:
            keyEncodingStrategy = .convertToSnakeCase
        }
    }
    
    class func camelCaseStrategy() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .useDefaultKeys
        return encoder
    }
    
    class func snakeStrategy() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
}
