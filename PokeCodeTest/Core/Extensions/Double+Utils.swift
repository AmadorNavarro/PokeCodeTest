//
//  Double+Utils.swift
//  PokeCodeTest
//
//  Created by Amador Navarro Lucas on 06/04/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

extension Double {
    
    func toString(withDecimals decimals: Int = 2) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.maximumFractionDigits = decimals
        
        return numberFormatter.string(from: NSNumber(floatLiteral: self)) ?? ""
    }
    
}
