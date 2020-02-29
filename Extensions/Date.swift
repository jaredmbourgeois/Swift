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
    public static var zero: Date { Date(timeIntervalSince1970: 0) }
    public static var basicFormat: String { "yyyyMMdd-HHmmss" }
    
    enum TimePeriod: TimeInterval {
        case nanosecond = 0.000000001
        case second = 1
        case minute = 60
        case hour = 3600
        case day = 86400
        case weekday
        case week = 604800
        case weekOfYear
        case month = 2592000
        case year = 31536000
        
        var dateComponent: Calendar.Component {
            switch self {
            case .nanosecond: return .nanosecond
            case .second: return .second
            case .minute: return .minute
            case .hour: return .hour
            case .day: return .day
            case .weekday: return .weekday
            case .weekOfYear: return .weekOfYear
            case .week: return .weekOfYear
            case .month: return .month
            case .year: return .year
            }
        }
    }
    
    enum Weekday: Int8 {
        case sunday = 1
        case monday = 2
        case tuesday = 3
        case wednesday = 4
        case thursday = 5
        case friday = 6
        case saturday = 7
        
        var index: Int8 { self.rawValue - 1 }
    }
    
    enum Month: Int8 {
        case january = 1
        case february = 2
        case march = 3
        case april = 4
        case may = 5
        case june = 6
        case july = 7
        case august = 8
        case september = 9
        case october = 10
        case november = 11
        case december = 12
        
        var index: Int8 { self.rawValue - 1 }
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