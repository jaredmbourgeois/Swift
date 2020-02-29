//
//  Extensions/Calendar.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension Calendar {
    public static var current: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        calendar.locale = .current
        return calendar
    }
    
    public static func dateComponents(calendar: Calendar? = nil, date: Date, calendarComponents: Set<Calendar.Component>) -> DateComponents {
        let calendar: Calendar = calendar ?? Calendar.current
        let dateComponents: DateComponents = calendar.dateComponents(calendarComponents, from: date)
        return dateComponents
    }
}
