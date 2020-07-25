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
    
    public static func daysInMonth(date: Date, calendar: Calendar = Calendar.current) -> Int {
        calendar.range(of: .day, in: .month, for: date)!.upperBound - 1
    }
    
    public static func firstDateThisMonth(date: Date, calendar: Calendar = Calendar.current) -> Date {
        let dateComponents = calendar.dateComponents([.month, .day], from: date)
        let dayInMonth = dateComponents.day ?? 1
        guard let firstDate = calendar.date(byAdding: .day, value: dayInMonth - 1, to: date)
        else { return date }
        return firstDate.midnight(calendar: calendar)
    }
    
    public static func lastDateThisMonth(date: Date, calendar: Calendar = Calendar.current) -> Date {
        let dateComponents = calendar.dateComponents([.month, .day], from: date)
        guard
            let dateRange = calendar.range(of: .day, in: .month, for: date),
            let dayInMonth = dateComponents.day,
            let dateMax = calendar.date(byAdding: .day, value: -((dateRange.upperBound - 1) - dayInMonth), to: date)
        else { return date }
        return dateMax
    }
    
    public static func firstDateNextMonth(date: Date, monthsFromFirstDate: Int = 1, calendar: Calendar = Calendar.current) -> Date {
        let lastDate = lastDateThisMonth(date: date, calendar: calendar)
        if lastDate != date {
            return lastDate.addingTimeInterval(TimePeriod.day.rawValue)
        } else { return lastDate }
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
    
    public func midnight(calendar: Calendar = Calendar.current) -> Date {
        calendar.startOfDay(for: self)
    }

    public func noon(calendar: Calendar = Calendar.current) -> Date {
        Date.noon(self, calendar: calendar)
    }
    
    public static func noon(_ date: Date = Date(), calendar: Calendar = Calendar.current) -> Date {
        Date(
            timeInterval: 12*60*60,
            since: calendar.startOfDay(for: date)
        )
    }
    
    public static func noonInWeek(dateInWeek: Date, weekday: Int, calendar: Calendar = Calendar.current) -> Date {
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
        let components: DateComponents = Calendar.current.dateComponents([Calendar.Component.weekday], from: date)
        guard components.weekday != nil else {
            return 1
        }
        return components.weekday!
    }
}
