//
//  Date+Utils.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

extension Date {
    
    public func dayTimeToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
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
