//
//  Date+Utils.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

extension Date {
    
    public func dateAndTimeToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = Constants.dateAndTimeFormat
        return dateFormatter.string(from: self)
    }
    
    public func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = Constants.dateFormat
        return dateFormatter.string(from: self)
    }
    
    public func withoutTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Calendar.current.date(from: components) ?? Date().withoutTime()
    }
    
    public func isSameDay(thanDate date: Date) -> Bool {
        let selfDay = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let otherDay = Calendar.current.dateComponents([.year, .month, .day], from: date)
        
        return selfDay == otherDay
    }
    
}

extension DateComponents {
    
    public func totalSeconds() -> Int {
        let seconds = (self.minute ?? 0) * 60
        return seconds + (self.second ?? 0)
    }
    
}
