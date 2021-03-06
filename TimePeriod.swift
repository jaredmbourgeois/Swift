//
//  TimePeriod.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

public enum TimePeriod: TimeInterval {
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
    
    public static let elevenHours59m59s: TimeInterval = 43199
    
    public init(_ timeInterval: TimeInterval) {
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
    
    public var calendarComponent: Calendar.Component {
        switch self {
        case .zero: return .nanosecond
        case .nanosecond: return .nanosecond
        // I went with closest Component, but if your use case involves
        // operations on values in sub-second time scales,
        // you'll probably need a different solution.
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
    
    public func string(
        abbreviated: Bool = false,
        singular: Bool = false,
        capitalized: Bool = false,
        uppercase: Bool = false
    ) -> String {
        var string: String = { switch self {
        case .zero: return ""
        case .nanosecond: return abbreviated ? "ns" : "nanosecond"
        case .microsecond: return abbreviated ? "us" : "microsecond"
        case .millisecond: return abbreviated ? "ms" : "millisecond"
        case .second: return abbreviated ? "s" : "second"
        case .minute: return abbreviated ? "m" : "minute"
        case .hour: return abbreviated ? "h" : "hour"
        case .dayQuarter: return abbreviated ? "d/4" : "1/4 day"
        case .dayHalf: return abbreviated ? "d/2" : "1/2 day"
        case .day: return abbreviated ? "d" : "day"
        case .week: return abbreviated ? "w" : "week"
        case .month: return abbreviated ? "mo" : "month"
        case .year: return abbreviated ? "y" : "year"
        } }()
        if !abbreviated {
            if !singular { string = string + (self != .zero ? "s" : "es") }
            if capitalized { string = string.localizedCapitalized }
            if uppercase { string = string.localizedUppercase }
        }
        return string
    }
    
    public struct Day {
        static func today(calendar: Calendar = Calendar.currentGregorian) -> TimePeriod.Day {
            TimePeriod.Day(Date(), calendar: calendar)
        }
        
        public let date: Date
        public let second: Second
        public let minute: Minute
        public let hour: Hour
        public let dayOfMonth: DayOfMonth
        public let weekday: Weekday
        public let month: Month
        public let year: Year
        
        public init(_ date: Date = Date(), calendar: Calendar = Calendar.currentGregorian) {
            let dateComponents = Calendar.dateComponents(
                calendar: calendar,
                date: date,
                calendarComponents: [ .year, .weekday, .day, .hour, .minute, .second, .nanosecond ]
            )
            self.date = date
            second = Second(dateComponents.second!, nanoseconds: dateComponents.nanosecond!)
            minute = Minute(dateComponents.minute!)
            hour = Hour(dateComponents.hour!)
            dayOfMonth = DayOfMonth(dateComponents.day!)
            weekday = Weekday(dayOfWeek: dateComponents.weekday!, firstWeekday: calendar.firstWeekday)
            month = Month(containing: date, calendar: calendar)
            year = Year(dateComponents.year!)
        }
    }
    
    public struct Second {
        public let value: Int
        public let valueNanoseconds: Int
        public let deltaNanoseconds: Int
        public let deltaMicroseconds: Int
        public let deltaMilliseconds: Int

        public init(_ value: Int, nanoseconds: Int) {
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
    
    public struct Minute {
        public let value: Int
        public init(_ value: Int) { self.value = value }
    }
    
    public struct Hour {
        public let value24: Int
        public let value12: Int
        public let isAM: Bool
        public init(_ value24: Int) {
            self.value24 = value24
            self.value12 = value24 > 12 ? value24 - 12 : value24
            self.isAM = value24 < 12
        }
        public func isAMSymbol(lowercase: Bool = false) -> String {
            lowercase ? isAM ? "am" : "pm" : isAM ? "AM" : "PM"
        }
    }
    
    public struct DayOfMonth {
        public let value: Int8
        public init(_ value: Int) { self.value = Int8(value) }
    }
    
    public struct Week {
        public let weekOfMonth: Int
        public let weekOfYear: Int
        public let noonOfFirstDay: Date
        public let noonOfSeventhDay: Date
        public let days: [TimePeriod.Day]
        
        public func weekdaySymbols(
            short: Bool = false,
            initial: Bool = false,
            uppercase: Bool = false,
            lowercase: Bool = false
        ) -> [String] {
            days.map { $0.weekday.string(short: short, initial: initial, uppercase: uppercase, lowercase: lowercase) }
        }
        
        public init(containing date: Date, calendar: Calendar = Calendar.currentGregorian) {
            let dateComponents = Calendar.dateComponents(
                calendar: calendar,
                date: date,
                calendarComponents: [ .weekOfMonth, .yearForWeekOfYear, .weekOfYear ]
            )
            weekOfMonth = dateComponents.weekOfMonth!
            weekOfYear = dateComponents.weekOfYear!
            
            noonOfFirstDay = calendar.date(from: dateComponents)!
            noonOfSeventhDay = calendar.date(byAdding: .day, value: 6, to: noonOfFirstDay)!
            
            var days: [TimePeriod.Day] = Array<TimePeriod.Day>(repeating: TimePeriod.Day(date), count: 7)
            var date: Date
            for dayIndex in 0 ..< days.count {
//                date = noonOfFirstDay.addingTimeInterval(TimeInterval(dayIndex) * TimePeriod.day.rawValue)
                date = calendar.date(byAdding: .day, value: dayIndex, to: noonOfFirstDay)!
                days[dayIndex] = TimePeriod.Day(date)
            }
            self.days = days
        }
    }
    
    public enum Weekday {
        case sunday(firstWeekday: Int8)
        case monday(firstWeekday: Int8)
        case tuesday(firstWeekday: Int8)
        case wednesday(firstWeekday: Int8)
        case thursday(firstWeekday: Int8)
        case friday(firstWeekday: Int8)
        case saturday(firstWeekday: Int8)
        
        public static let symbols: [String] = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
        public static let symbolsShort: [String] = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
        public static let symbolsInitial: [String] = [ "S", "M", "T", "W", "T", "F", "S" ]
        
        public init(dayOfWeek: Int, firstWeekday: Int) {
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
        
        public init(_ date: Date, calendar: Calendar = Calendar.currentGregorian) {
            let dateComponents = Calendar.dateComponents(
                calendar: calendar,
                date: date,
                calendarComponents: [ .weekday ]
            )
            self = Weekday(dayOfWeek: dateComponents.weekday!, firstWeekday: calendar.firstWeekday)
        }
        
        public func weekdayValue() -> Int {
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
        public func weekdayIndex() -> Int {
            weekdayValue() - 1
        }
        public func weekdayIndexDefault() -> Int {
            switch self {
            case .sunday: return 0
            case .monday: return 1
            case .tuesday: return 2
            case .wednesday: return 3
            case .thursday: return 4
            case .friday: return 5
            case .saturday: return 6
            }
        }
        public func string(
            short: Bool = false,
            initial: Bool = false,
            uppercase: Bool = false,
            lowercase: Bool = false
        ) -> String {
            var string: String
            
            let weekdayIndex = weekdayIndexDefault()
            if initial { string = Weekday.symbolsInitial[weekdayIndex] }
            else if short { string = Weekday.symbolsShort[weekdayIndex] }
            else { string = Weekday.symbols[weekdayIndex] }
            
            if uppercase { string = string.localizedUppercase }
            if lowercase { string = string.localizedLowercase }
            
            return string
        }
    }
    
    public enum Month: Equatable {
        public static func this(calendar: Calendar) -> TimePeriod.Month {
            TimePeriod.Month(containing: Date(), calendar: calendar)
        }
        
        case january(dateMaxMin: Date.MaxMin)
        case february(dateMaxMin: Date.MaxMin)
        case march(dateMaxMin: Date.MaxMin)
        case april(dateMaxMin: Date.MaxMin)
        case may(dateMaxMin: Date.MaxMin)
        case june(dateMaxMin: Date.MaxMin)
        case july(dateMaxMin: Date.MaxMin)
        case august(dateMaxMin: Date.MaxMin)
        case september(dateMaxMin: Date.MaxMin)
        case october(dateMaxMin: Date.MaxMin)
        case november(dateMaxMin: Date.MaxMin)
        case december(dateMaxMin: Date.MaxMin)
        
        public static func ==(lhs: Month, rhs: Month) -> Bool {
            switch (lhs, rhs) {
            case (.january, .january): return true
            case (.february, .february): return true
            case (.march, .march): return true
            case (.april, .april): return true
            case (.may, .may): return true
            case (.june, .june): return true
            case (.july, .july): return true
            case (.august, .august): return true
            case (.september, .september): return true
            case (.october, .october): return true
            case (.november, .november): return true
            case (.december, .december): return true
            default: return false
            }
        }
        
        public static func equalDateMaxMin(_ firstMonth: Month, _ secondMonth: Month) -> Bool {
            firstMonth.firstDate == secondMonth.firstDate
                && firstMonth.lastDate == secondMonth.lastDate
        }
        
        public func equalDateMaxMin(_ otherMonth: Month, calendar: Calendar) -> Bool {
            firstDate == otherMonth.firstDate
                && lastDate == otherMonth.lastDate
        }
        
        public func contains(_ date: Date, calendar: Calendar) -> Bool {
            (date >= firstDate && date <= lastDate)
                || calendar.isDate(date, inSameDayAs: firstDate)
                || calendar.isDate(date, inSameDayAs: lastDate)
        }
        
        public init(containing date: Date, calendar: Calendar) {
            let dateMaxMin = Date.MaxMin(
                max: Date.lastDateInMonth(containing: date, calendar: calendar),
                min: Date.firstDateInMonth(containing: date, calendar: calendar)
            )
            let dateComponents = Calendar.dateComponents(
                calendar: calendar,
                date: date,
                calendarComponents: [ .month ]
            )
            self = { switch dateComponents.month! {
            case 1: return .january(dateMaxMin: dateMaxMin)
            case 2: return .february(dateMaxMin: dateMaxMin)
            case 3: return .march(dateMaxMin: dateMaxMin)
            case 4: return .april(dateMaxMin: dateMaxMin)
            case 5: return .may(dateMaxMin: dateMaxMin)
            case 6: return .june(dateMaxMin: dateMaxMin)
            case 7: return .july(dateMaxMin: dateMaxMin)
            case 8: return .august(dateMaxMin: dateMaxMin)
            case 9: return .september(dateMaxMin: dateMaxMin)
            case 10: return .october(dateMaxMin: dateMaxMin)
            case 11: return .november(dateMaxMin: dateMaxMin)
            case 12: return .december(dateMaxMin: dateMaxMin)
            default: return .december(dateMaxMin: dateMaxMin)
            }}()
        }
        
        public var firstDate: Date {
            switch self {
            case .january(let dateMaxMin): return dateMaxMin.min
            case .february(let dateMaxMin): return dateMaxMin.min
            case .march(let dateMaxMin): return dateMaxMin.min
            case .april(let dateMaxMin): return dateMaxMin.min
            case .may(let dateMaxMin): return dateMaxMin.min
            case .june(let dateMaxMin): return dateMaxMin.min
            case .july(let dateMaxMin): return dateMaxMin.min
            case .august(let dateMaxMin): return dateMaxMin.min
            case .september(let dateMaxMin): return dateMaxMin.min
            case .october(let dateMaxMin): return dateMaxMin.min
            case .november(let dateMaxMin): return dateMaxMin.min
            case .december(let dateMaxMin): return dateMaxMin.min
            }
        }
        
        public var lastDate: Date {
            switch self {
            case .january(let dateMaxMin): return dateMaxMin.max
            case .february(let dateMaxMin): return dateMaxMin.max
            case .march(let dateMaxMin): return dateMaxMin.max
            case .april(let dateMaxMin): return dateMaxMin.max
            case .may(let dateMaxMin): return dateMaxMin.max
            case .june(let dateMaxMin): return dateMaxMin.max
            case .july(let dateMaxMin): return dateMaxMin.max
            case .august(let dateMaxMin): return dateMaxMin.max
            case .september(let dateMaxMin): return dateMaxMin.max
            case .october(let dateMaxMin): return dateMaxMin.max
            case .november(let dateMaxMin): return dateMaxMin.max
            case .december(let dateMaxMin): return dateMaxMin.max
            }
        }
        
        public var index: Int { int - 1 }
        public var int: Int {
            switch self {
            case .january: return 1
            case .february: return 2
            case .march: return 3
            case .april: return 4
            case .may: return 5
            case .june: return 6
            case .july: return 7
            case .august: return 8
            case .september: return 9
            case .october: return 10
            case .november: return 11
            case .december: return 12
            }
        }
        public var int8: Int8 { Int8(int) }
        public var int16: Int16 { Int16(int) }
        public var int32: Int32 { Int32(int) }
        public var int64: Int64 { Int64(int) }
        public func string(
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
        public static let symbols: [String] = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
        public static let symbolsShort: [String] = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]
        public static let symbolsInitial: [String] = [ "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D" ]
    }

    public struct Year {
        public let value: Int16
        
        public var int: Int { Int(value) }
        public var int32: Int32 { Int32(int) }
        public var int64: Int64 { Int64(int) }

        public init(_ value: Int) { self.value = Int16(value) }
    }
}
