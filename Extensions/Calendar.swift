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
    public static var currentGregorian: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        calendar.locale = .current
        return calendar
    }
    
    public static func dateComponents(calendar: Calendar? = nil, date: Date, calendarComponents: Set<Calendar.Component>) -> DateComponents {
        let calendar: Calendar = calendar ?? Calendar.currentGregorian
        let dateComponents: DateComponents = calendar.dateComponents(calendarComponents, from: date)
        return dateComponents
    }
    
    public func startAndEndOfDay(_ date: Date) -> Date.MaxMin {
        let dateMin = startOfDay(for: date)
        return Date.MaxMin(
            max: Date(timeInterval: TimePeriod.day.rawValue - 1, since: dateMin),
            min: dateMin
        )
    }
}
