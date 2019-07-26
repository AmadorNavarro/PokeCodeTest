//
//  String+Utils.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

extension String {
    
    func dateStringToTime() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self) ?? Date()
    }
    
    func timeStringToTime() -> DateComponents {
        var components = DateComponents()
        let split = self.split(separator: ":")
        guard split.count == 2 else { return components }
        components.minute = Int(String(split[0]))
        components.second = Int(String(split[1]))
        return components
    }
    
    func timeStringToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = Constants.timeFormatter
        
        return dateFormatter.date(from: self) ?? Date()
    }

}
