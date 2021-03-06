//
//  Extensions/DateFormatter.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension DateFormatter {
    enum Symbol {
        case normal
        case short
        case veryShort
    }
    
    func symbols(timePeriod: TimePeriod, symbol: Symbol = .normal) -> [String]? {
        return DateFormatter.symbols(
            dateFormatter: self,
            timePeriod: timePeriod,
            symbol: symbol
        )
    }
    
    static func symbols(dateFormatter: DateFormatter? = nil, timePeriod: TimePeriod = .day, symbol: Symbol = .normal) -> [String]? {
        let dateFormatter: DateFormatter = dateFormatter ?? DateFormatter()
        switch symbol {
        case .normal:
            switch timePeriod {
            case .month: return dateFormatter.monthSymbols
            default: return dateFormatter.weekdaySymbols
            }
        case .short:
            switch timePeriod {
            case .month: return dateFormatter.shortMonthSymbols
            default: return dateFormatter.shortWeekdaySymbols
            }
        case .veryShort:
            switch timePeriod {
            case .month: return dateFormatter.veryShortMonthSymbols
            default: return dateFormatter.veryShortWeekdaySymbols
            }
        }
    }
    
    func symbol(
        dateFormatter: DateFormatter? = nil,
        calendar: Calendar? = nil,
        date: Date,
        timePeriod: TimePeriod = .day,
        symbol: Symbol = .normal
    ) -> String {
        return DateFormatter.symbol(
            dateFormatter: self,
            calendar: calendar,
            date: date,
            timePeriod: timePeriod,
            symbol: symbol
        )
    }
    
    static func symbol(
        dateFormatter: DateFormatter? = nil,
        calendar: Calendar? = nil,
        date: Date,
        timePeriod: TimePeriod = .day,
        symbol: Symbol = .normal
    ) -> String {
        let components: DateComponents = Calendar.dateComponents(calendar: calendar, date: date, calendarComponents: [timePeriod.calendarComponent])
        let symbols: [String]? = DateFormatter.symbols(
            dateFormatter: dateFormatter,
            timePeriod: timePeriod,
            symbol: symbol
        )
        switch timePeriod {
        case .month: return symbols![components.month! - 1]
        default: return symbols![components.weekday! - 1]
        }
        
    }
}
