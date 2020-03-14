//
//  TimePeriod.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

enum TimePeriod: TimeInterval {
    case zero = 0
    case nanosecond = 0.000000001
    case microsecond = 0.000001
    case millisecond = 0.001
    case second = 1
    case minute = 60
    case hour = 3600
    case dayQuarter = 21600
    case dayHalf = 43200
    case day = 86400
    case week = 604800
    case month = 2592000
    case year = 31536000
    
    init(_ timeInterval: TimeInterval) {
        switch timeInterval {
        case TimePeriod.zero.rawValue: self = .zero
        case TimePeriod.nanosecond.rawValue: self = .nanosecond
        case TimePeriod.microsecond.rawValue: self = .microsecond
        case TimePeriod.millisecond.rawValue: self = .millisecond
        case TimePeriod.second.rawValue: self = .second
        case TimePeriod.minute.rawValue: self = .minute
        case TimePeriod.hour.rawValue: self = .hour
        case TimePeriod.dayQuarter.rawValue: self = .dayQuarter
        case TimePeriod.dayHalf.rawValue: self = .dayHalf
        case TimePeriod.day.rawValue: self = .day
        case TimePeriod.week.rawValue: self = .week
        case TimePeriod.month.rawValue: self = .month
        case TimePeriod.year.rawValue: self = .year
        default:
            if timeInterval <= TimePeriod.nanosecond.rawValue { self = .nanosecond }
            else if timeInterval <= TimePeriod.microsecond.rawValue { self = .microsecond }
            else if timeInterval <= TimePeriod.millisecond.rawValue { self = .millisecond }
            else if timeInterval <= TimePeriod.second.rawValue { self = .second }
            else if timeInterval <= TimePeriod.minute.rawValue { self = .minute }
            else if timeInterval <= TimePeriod.hour.rawValue { self = .hour }
            else if timeInterval <= TimePeriod.dayQuarter.rawValue { self = .dayQuarter }
            else if timeInterval <= TimePeriod.dayHalf.rawValue { self = .dayHalf }
            else if timeInterval <= TimePeriod.day.rawValue { self = .day }
            else if timeInterval <= TimePeriod.week.rawValue { self = .week }
            else if timeInterval <= TimePeriod.month.rawValue { self = .month }
            else { self = .year }
        }
    }
    
    var calendarComponent: Calendar.Component {
        switch self {
        case .zero: return .nanosecond
        case .nanosecond: return .nanosecond
        case .microsecond: return .nanosecond
        case .millisecond: return .second
        case .second: return .second
        case .minute: return .minute
        case .hour: return .hour
        case .dayQuarter: return .hour
        case .dayHalf: return .hour
        case .day: return .day
        case .week: return .weekOfYear
        case .month: return .month
        case .year: return .year
        }
    }
    
    func string(singular: Bool = false, capitalized: Bool = false) -> String {
        var string: String = ""
        switch self {
        case .zero: string = capitalized ? "Zero" : "zero"
        case .nanosecond: string = "ns"
        case .microsecond: string = "us"
        case .millisecond: string = "ms"
        case .second: string = capitalized ? "Second" : "second"
        case .minute: string = capitalized ? "Minute" : "minute"
        case .dayQuarter: string = capitalized ? "1/4 Day" : "1/4 day"
        case .dayHalf: string = capitalized ? "1/2 Day" : "1/2 day"
        case .hour: string = capitalized ? "Hour" : "hour"
        case .day: string = capitalized ? "Day" : "day"
        case .week: string = capitalized ? "Week" : "week"
        case .month: string = capitalized ? "Month" : "month"
        case .year: string = capitalized ? "Year" : "year"
        }
        return singular == true ? string : string + (self == .zero ? "es" : "s")
    }
    
    struct Day {
        let date: Date
        let second: Second
        let minute: Minute
        let hour: Hour
        let dayOfMonth: DayOfMonth
        let weekday: Weekday
        let month: Month
        let year: Year
        init(_ date: Date, calendar: Calendar = Calendar.current) {
            let dateComponents = Calendar.dateComponents(
                calendar: calendar,
                date: date,
                calendarComponents: [ .year, .month, .weekday, .day, .hour, .minute, .second, .nanosecond ]
            )
            self.date = date
            self.second = Second(dateComponents.second!, nanoseconds: dateComponents.nanosecond!)
            self.minute = Minute(dateComponents.minute!)
            self.hour = Hour(dateComponents.hour!)
            self.dayOfMonth = DayOfMonth(dateComponents.day!)
            self.weekday = Weekday(rawValue: Int8(dateComponents.weekday!))!
            self.month = Month(rawValue: Int8(dateComponents.month!))!
            self.year = Year(dateComponents.year!)
        }
    }
    
    struct Second {
        let value: Int
        let nano: TimeInterval
        var micro: TimeInterval { nano / 1000 }
        var milli: TimeInterval { micro / 1000 }
        init(_ value: Int, nanoseconds: Int) {
            self.value = Int(value)
            self.nano = TimeInterval(nanoseconds)
        }
    }
    
    struct Minute {
        let value: Int8
        init(_ value: Int) { self.value = Int8(value) }
    }
    
    struct Hour {
        let value24: Int
        var value12: Int { value24 > 12 ? value24 - 12 : value24 }
        var isAM: Bool { value24 >= 12 }
        var isAMSymbol: String { isAM ? "AM" : "PM" }
        init(_ value24: Int) { self.value24 = value24 }
    }
    
    struct DayOfMonth {
        let value: Int8
        init(_ value: Int) { self.value = Int8(value) }
    }
    
    enum Weekday: Int8 {
        case sunday = 1
        case monday = 2
        case tuesday = 3
        case wednesday = 4
        case thursday = 5
        case friday = 6
        case saturday = 7
        
        var index: Int { Int(self.rawValue - 1) }
        var int: Int { Int(self.rawValue) }
        var int8: Int8 { self.rawValue }
        var int16: Int16 { Int16(self.rawValue) }
        var int32: Int32 { Int32(self.rawValue) }
        var int64: Int64 { Int64(self.rawValue) }
        var string: String { Weekday.symbols[self.index] }
        var stringShort: String { Weekday.symbolsShort[self.index] }
        var stringInitial: String { String(string.first!) }
        static let symbols: [String] = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
        static let symbolsShort: [String] = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
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
        
        var index: Int { Int(self.rawValue - 1) }
        var int: Int { Int(self.rawValue) }
        var int8: Int8 { self.rawValue }
        var int16: Int16 { Int16(self.rawValue) }
        var int32: Int32 { Int32(self.rawValue) }
        var int64: Int64 { Int64(self.rawValue) }
        var string: String { Month.symbols[self.index] }
        var stringShort: String { Month.symbolsShort[self.index] }
        var stringInitial: String { String(string.first!) }
        static let symbols: [String] = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
        static let symbolsShort: [String] = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]
    }

    struct Year {
        let value: Int16
        init(_ value: Int) { self.value = Int16(value) }
    }
}
