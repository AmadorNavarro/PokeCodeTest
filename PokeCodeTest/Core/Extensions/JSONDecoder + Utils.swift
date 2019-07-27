//
//  JSONDecoder + Utils.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    convenience init(keyStrategy: KeyCodableStrategy) {
        self.init()
        
        switch keyStrategy {
        case .camelCase:
            keyDecodingStrategy = .useDefaultKeys
        case .snake:
            keyDecodingStrategy = .convertFromSnakeCase
        }
    }
    
    class func camelCaseStrategy() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return decoder
    }
    
    class func snakeStrategy() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
}
