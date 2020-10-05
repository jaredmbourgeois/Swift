//
//  Extensions/Date.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension Date {
    public static let zero: Date = Date(timeIntervalSince1970: 0)
    public static let max: Date = Date(timeIntervalSince1970: Double.greatestFiniteMagnitude)
    public static let basicFormat: String = "yyyyMMdd-HHmmss"
    
    public struct MaxMin {
        let max: Date
        let min: Date
    }
    
    init(_ date: NSDate) {
        self = Date(timeIntervalSince1970: date.timeIntervalSince1970)
    }
    
    public static func isInTimeInterval(firstDate: Date, secondDate: Date, timeInterval: TimeInterval) -> Bool {
        fabs(firstDate.timeIntervalSince(secondDate)) <= timeInterval
    }
    
    public static func daysInMonth(date: Date, calendar: Calendar = Calendar.currentGregorian) -> Int {
        calendar.range(of: .day, in: .month, for: date)!.upperBound - 1
    }
    
    public static func firstDateInMonth(containing date: Date, calendar: Calendar = Calendar.currentGregorian) -> Date {
        let noon = Date.noon(date, calendar: calendar)
        let dateComponents = Calendar.dateComponents(
            calendar: calendar,
            date: noon,
            calendarComponents: [ .day ]
        )
        return calendar.date(
            byAdding: .day,
            value: -(dateComponents.day! - 1),
            to: noon
        )!.addingTimeInterval(-TimePeriod.dayHalf.rawValue)
    }
    
    public static func firstDateThisMonth(calendar: Calendar = Calendar.currentGregorian) -> Date {
        firstDateInMonth(containing: Date(), calendar: calendar)
    }
    
    public static func firstDatePreviousMonth(
        referencing date: Date,
        months: Int = 1,
        calendar: Calendar = Calendar.currentGregorian
    ) -> Date {
        return calendar.date(
            byAdding: .month,
            value: -months,
            to: firstDateInMonth(containing: date, calendar: calendar)
        )!
    }
    
    public static func firstDateNextMonth(
        referencing date: Date,
        months: Int = 1,
        calendar: Calendar = Calendar.currentGregorian
    ) -> Date {
        return calendar.date(
            byAdding: .month,
            value: months,
            to: firstDateInMonth(containing: date, calendar: calendar)
        )!
    }
    
    public static func lastDateInMonth(containing date: Date, calendar: Calendar = Calendar.currentGregorian) -> Date {
        let firstDate = firstDateInMonth(containing: date, calendar: calendar)
        return calendar.date(
            byAdding: .day,
            value: daysInMonth(date: date, calendar: calendar) - 1,
            to: firstDate
        )!.addingTimeInterval(TimePeriod.elevenHours59m59s)
    }
    
    public static func lastDateThisMonth(calendar: Calendar = Calendar.currentGregorian) -> Date {
        lastDateInMonth(containing: Date(), calendar: calendar)
    }
    
    public static func lastDatePreviousMonth(
        referencing date: Date,
        months: Int = 1,
        calendar: Calendar = Calendar.currentGregorian
    ) -> Date {
        let firstDayInMonth = firstDateInMonth(containing: date, calendar: calendar)
        let firstDayPreviousMonth = firstDatePreviousMonth(referencing: firstDayInMonth, months: months, calendar: calendar)
        return lastDateInMonth(containing: firstDayPreviousMonth)
    }
    
    public static func lastDateNextMonth(
        referencing date: Date,
        months: Int = 1,
        calendar: Calendar = Calendar.currentGregorian
    ) -> Date {
        let firstDayInMonth = firstDateInMonth(containing: date, calendar: calendar)
        let firstDayNextMonth = firstDateNextMonth(referencing: firstDayInMonth, months: months, calendar: calendar)
        return lastDateInMonth(containing: firstDayNextMonth)
    }
    
    public static func localDate(date: Date, format: String?, dateFormatter: DateFormatter = DateFormatter()) -> String {
        dateFormatter.dateFormat = format ?? Date.basicFormat
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
    
    public static func localTime(date: Date, dateFormatter: DateFormatter = DateFormatter()) -> String {
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
    
    public static func milliseconds(date: Date? = nil) -> Int64 {
        Int64((((date ?? Date()).timeIntervalSince1970 * 1000).rounded()))
    }
    
    public func midnight(calendar: Calendar = Calendar.currentGregorian) -> Date {
        calendar.startOfDay(for: self)
    }

    public func noon(calendar: Calendar = Calendar.currentGregorian) -> Date {
        Date.noon(self, calendar: calendar)
    }
    
    public static func noon(_ date: Date = Date(), calendar: Calendar = Calendar.currentGregorian) -> Date {
        Date(
            timeInterval: 12*60*60,
            since: calendar.startOfDay(for: date)
        )
    }
    
    public static func noonInWeek(dateInWeek: Date, weekday: Int, calendar: Calendar = Calendar.currentGregorian) -> Date {
        let twentyFourHours: TimeInterval = 24*60*60
        let components: DateComponents = calendar.dateComponents([Calendar.Component.weekday, Calendar.Component.weekOfYear], from: dateInWeek)
        let noonOfDate: Date = Date.noon(dateInWeek, calendar: calendar)
        if let componentsWeekday = components.weekday {
            return Date(timeInterval: Double(weekday - componentsWeekday) * twentyFourHours, since: noonOfDate)
        }
        else {
            return noonOfDate
        }
    }
    
    public static func seconds(date: Date? = nil) -> Int64 {
        Int64((((date ?? Date()).timeIntervalSince1970).rounded()))
    }
    
    public static func weekday(date: Date) -> Int {
        let components: DateComponents = Calendar.currentGregorian.dateComponents([Calendar.Component.weekday], from: date)
        guard components.weekday != nil else {
            return 1
        }
        return components.weekday!
    }
}
