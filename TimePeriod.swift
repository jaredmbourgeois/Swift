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
    
    func string(singular: Bool = false, capitalized: Bool = false, uppercase: Bool = false) -> String {
        var string: String = { switch self {
        case .zero: return "zero"
        case .nanosecond: return "ns"
        case .microsecond: return "us"
        case .millisecond: return "ms"
        case .second: return "second"
        case .minute: return "minute"
        case .dayQuarter: return "1/4 day"
        case .dayHalf: return "1/2 day"
        case .hour: return "hour"
        case .day: return "day"
        case .week: return "week"
        case .month: return "month"
        case .year: return "year"
        } }()
        let isNotAbbreviation = self != .nanosecond && self != .microsecond && self != .millisecond
        if isNotAbbreviation {
            if !singular {
                if self == .zero { string = string + "es" }
                else { string = string + "s" }
            }
            if capitalized { string = string.localizedCapitalized }
            if uppercase { string = string.localizedUppercase }
        }
        return string
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
            second = Second(dateComponents.second!, nanoseconds: dateComponents.nanosecond!)
            minute = Minute(dateComponents.minute!)
            hour = Hour(dateComponents.hour!)
            dayOfMonth = DayOfMonth(dateComponents.day!)
            weekday = Weekday(dayOfWeek: dateComponents.weekday!, firstWeekday: calendar.firstWeekday)
            month = Month(rawValue: Int8(dateComponents.month!))!
            year = Year(dateComponents.year!)
        }
    }
    
    struct Second {
        let value: Int
        let valueNanoseconds: Int
        let deltaNanoseconds: Int
        let deltaMicroseconds: Int
        let deltaMilliseconds: Int

        init(_ value: Int, nanoseconds: Int) {
            self.value = value
            self.valueNanoseconds = nanoseconds
            
            let millisecondsNanosecondsRemainder = nanoseconds % 1_000_000
            let nanosecondsInMilliseconds = nanoseconds - millisecondsNanosecondsRemainder
            let nanosecondsAfterDeltaMilliseconds = nanoseconds - nanosecondsInMilliseconds
            let microsecondsNanosecondsRemainder = nanosecondsAfterDeltaMilliseconds % 1_000
            let nanosecondsInMicroseconds = nanosecondsAfterDeltaMilliseconds - microsecondsNanosecondsRemainder
            
            deltaMilliseconds = Int((Double(nanosecondsInMilliseconds) / Double(1_000_000)).rounded())
            deltaMicroseconds = Int((Double(nanosecondsInMicroseconds) / Double(1_000)).rounded())
            deltaNanoseconds = nanoseconds - nanosecondsInMicroseconds - nanosecondsInMilliseconds
        }
    }
    
    struct Minute {
        let value: Int
        init(_ value: Int) { self.value = value }
    }
    
    struct Hour {
        let value24: Int
        let value12: Int
        let isAM: Bool
        init(_ value24: Int) {
            self.value24 = value24
            self.value12 = value24 > 12 ? value24 - 12 : value24
            self.isAM = value24 < 12
        }
        func isAMSymbol(lowercase: Bool = false) -> String {
            lowercase ?
                isAM ? "am" : "pm" :
                isAM ? "AM" : "PM"
        }

    }
    
    struct DayOfMonth {
        let value: Int8
        init(_ value: Int) { self.value = Int8(value) }
    }
    
    struct Week {
        let noonOfStartDay: TimePeriod.Day
        let noonOfEndDay: TimePeriod.Day
    }
    
    enum Weekday {
        case sunday(firstWeekday: Int8)
        case monday(firstWeekday: Int8)
        case tuesday(firstWeekday: Int8)
        case wednesday(firstWeekday: Int8)
        case thursday(firstWeekday: Int8)
        case friday(firstWeekday: Int8)
        case saturday(firstWeekday: Int8)
        
        static let symbols: [String] = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
        static let symbolsShort: [String] = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
        static let symbolsInitial: [String] = [ "S", "M", "T", "W", "T", "F", "S" ]
        
        init(dayOfWeek: Int, firstWeekday: Int) {
            let value = dayOfWeek < 0 ? 0 : dayOfWeek > 7 ? 7 : dayOfWeek
            self = { switch value {
            case 1: return .sunday(firstWeekday: Int8(firstWeekday))
            case 2: return .monday(firstWeekday: Int8(firstWeekday))
            case 3: return .tuesday(firstWeekday: Int8(firstWeekday))
            case 4: return .wednesday(firstWeekday: Int8(firstWeekday))
            case 5: return .thursday(firstWeekday: Int8(firstWeekday))
            case 6: return .friday(firstWeekday: Int8(firstWeekday))
            case 7: return .saturday(firstWeekday: Int8(firstWeekday))
            default: return .sunday(firstWeekday: Int8(firstWeekday))
            } }()
        }
        func weekdayValue() -> Int {
            switch self {
            case .sunday(let firstWeekday): return Int(1 + (firstWeekday - 1))
            case .monday(let firstWeekday): return Int(2 + (firstWeekday - 1))
            case .tuesday(let firstWeekday): return Int(3 + (firstWeekday - 1))
            case .wednesday(let firstWeekday): return Int(4 + (firstWeekday - 1))
            case .thursday(let firstWeekday): return Int(5 + (firstWeekday - 1))
            case .friday(let firstWeekday): return Int(6 + (firstWeekday - 1))
            case .saturday(let firstWeekday): return Int(7 + (firstWeekday - 1))
            }
        }
        func weekdayIndex() -> Int {
            weekdayValue() - 1
        }
        func weekdayIndexDefault() -> Int {
            switch self {
            case .sunday: return 1
            case .monday: return 2
            case .tuesday: return 3
            case .wednesday: return 4
            case .thursday: return 5
            case .friday: return 6
            case .saturday: return 7
            }
        }
        func string(
            short: Bool = false,
            initial: Bool = false,
            uppercase: Bool = false,
            lowercase: Bool = false
        ) -> String {
            var string: String
            
            if initial { string = Weekday.symbolsInitial[weekdayIndexDefault()] }
            else if short { string = Weekday.symbolsShort[weekdayIndexDefault()] }
            else { string = Weekday.symbols[weekdayIndexDefault()] }
            
            if uppercase { string = string.localizedUppercase }
            if lowercase { string = string.localizedLowercase }
            
            return string
        }
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
        func string(
            short: Bool = false,
            initial: Bool = false,
            uppercase: Bool = false,
            lowercase: Bool = false
        ) -> String {
            var string: String
            
            if initial { string = Month.symbolsInitial[index] }
            else if short { string = Month.symbolsShort[index] }
            else { string = Month.symbols[index] }
            
            if uppercase { string = string.localizedUppercase }
            if lowercase { string = string.localizedLowercase }
            
            return string
        }
        static let symbols: [String] = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
        static let symbolsShort: [String] = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]
        static let symbolsInitial: [String] = [ "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D" ]
    }

    struct Year {
        let value: Int16
        init(_ value: Int) { self.value = Int16(value) }
    }
}
