//
//  Int + Utils.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

extension Int {
    
    static func pokemonID() -> Int {
        return self.random(in: 1...1000)
    }
    
}
