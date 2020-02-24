//
//  Format.swift
//  Jared Bourgeois
//
//  Created by Jared Bourgeois on 12/16/19.
//  Copyright © 2020 Jared Bourgeois. All rights reserved.
//

import UIKit
import CoreGraphics

public enum Format {
    public enum Degree: CGFloat {
        case none = 0.0
        case light = 0.1
        case mediumLight = 0.3
        case medium = 0.5
        case mediumHigh = 0.7
        case high = 0.9
        case all = 1.0
    }
    
    public enum Height: CGFloat, Sizable {
        case zero = 0
        case extraSmall = 16
        case small = 24
        case mediumSmall = 32
        case medium = 42
        case mediumLarge = 56
        case large = 64
        case extraLarge = 72
        case title = 80
        
        static public func size(from number: NSNumber) -> Format.Size {
            switch number.cgFloatValue {
            case Height.zero.rawValue: return Format.Size.zero
            case Height.extraSmall.rawValue: return Format.Size.extraSmall
            case Height.small.rawValue: return Format.Size.small
            case Height.mediumSmall.rawValue: return Format.Size.mediumSmall
            case Height.medium.rawValue: return Format.Size.medium
            case Height.mediumLarge.rawValue: return Format.Size.mediumLarge
            case Height.large.rawValue: return Format.Size.large
            case Height.extraLarge.rawValue: return Format.Size.extraLarge
            case Height.title.rawValue: return Format.Size.title
            default: return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch size {
            case Size.zero: return NSNumber(CGFloat.zero)
            case Size.extraSmall: return NSNumber(Height.extraSmall.rawValue)
            case Size.small: return NSNumber(Height.small.rawValue)
            case Size.mediumSmall: return NSNumber(Height.mediumSmall.rawValue)
            case Size.medium: return NSNumber(Height.medium.rawValue)
            case Size.mediumLarge: return NSNumber(Height.mediumLarge.rawValue)
            case Size.large: return NSNumber(Height.large.rawValue)
            case Size.extraLarge: return NSNumber(Height.extraLarge.rawValue)
            case Size.title: return NSNumber(Height.title.rawValue)
            }
        }
    }

    public enum Inset: CGFloat, Sizable {
        case zero = 0
        case extraSmall = 1
        case small = 2
        case mediumSmall = 4
        case medium = 6
        case mediumLarge = 8
        case large = 10
        case extraLarge = 12
        case title = 16
        
        static public func size(from number: NSNumber) -> Format.Size {
            switch number.cgFloatValue {
            case Inset.zero.rawValue: return Format.Size.zero
            case Inset.extraSmall.rawValue: return Format.Size.extraSmall
            case Inset.small.rawValue: return Format.Size.small
            case Inset.mediumSmall.rawValue: return Format.Size.mediumSmall
            case Inset.medium.rawValue: return Format.Size.medium
            case Inset.mediumLarge.rawValue: return Format.Size.mediumLarge
            case Inset.large.rawValue: return Format.Size.large
            case Inset.extraLarge.rawValue: return Format.Size.extraLarge
            case Inset.title.rawValue: return Format.Size.title
            default: return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch size {
            case Size.zero: return NSNumber(CGFloat.zero)
            case Size.extraSmall: return NSNumber(Inset.extraSmall.rawValue)
            case Size.small: return NSNumber(Inset.small.rawValue)
            case Size.mediumSmall: return NSNumber(Inset.mediumSmall.rawValue)
            case Size.medium: return NSNumber(Inset.medium.rawValue)
            case Size.mediumLarge: return NSNumber(Inset.mediumLarge.rawValue)
            case Size.large: return NSNumber(Inset.large.rawValue)
            case Size.extraLarge: return NSNumber(Inset.extraLarge.rawValue)
            case Size.title: return NSNumber(Inset.title.rawValue)
            }
        }
    }

    public enum LineWidth: CGFloat, Sizable {
        case zero = 0
        case extraSmall = 0.5
        case small = 1
        case mediumSmall = 2
        case medium = 4
        case mediumLarge = 6
        case large = 8
        case extraLarge = 12
        case title = 16
        
        static public func size(from number: NSNumber) -> Format.Size {
            switch number.cgFloatValue {
            case LineWidth.zero.rawValue: return Format.Size.zero
            case LineWidth.extraSmall.rawValue: return Format.Size.extraSmall
            case LineWidth.small.rawValue: return Format.Size.small
            case LineWidth.mediumSmall.rawValue: return Format.Size.mediumSmall
            case LineWidth.medium.rawValue: return Format.Size.medium
            case LineWidth.mediumLarge.rawValue: return Format.Size.mediumLarge
            case LineWidth.large.rawValue: return Format.Size.large
            case LineWidth.extraLarge.rawValue: return Format.Size.extraLarge
            case LineWidth.title.rawValue: return Format.Size.title
            default: return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch size {
            case Size.zero: return NSNumber(CGFloat.zero)
            case Size.extraSmall: return NSNumber(LineWidth.extraSmall.rawValue)
            case Size.small: return NSNumber(LineWidth.small.rawValue)
            case Size.mediumSmall: return NSNumber(LineWidth.mediumSmall.rawValue)
            case Size.medium: return NSNumber(LineWidth.medium.rawValue)
            case Size.mediumLarge: return NSNumber(LineWidth.mediumLarge.rawValue)
            case Size.large: return NSNumber(LineWidth.large.rawValue)
            case Size.extraLarge: return NSNumber(LineWidth.extraLarge.rawValue)
            case Size.title: return NSNumber(LineWidth.title.rawValue)
            }
        }
    }

    public enum Position: Int {
        case top = 0
        case middle = 1
        case bottom = 2
        case left = 3
        case right = 4
        case isolated = 5
    }

    public enum Radius: CGFloat, Sizable {
        case zero = 0
        case extraSmall = 1
        case small = 2
        case mediumSmall = 4
        case medium = 6
        case mediumLarge = 8
        case large = 10
        case extraLarge = 12
        case title = 16
        
        static public func size(from number: NSNumber) -> Format.Size {
            switch number.cgFloatValue {
            case Radius.zero.rawValue: return Format.Size.zero
            case Radius.extraSmall.rawValue: return Format.Size.extraSmall
            case Radius.small.rawValue: return Format.Size.small
            case Radius.mediumSmall.rawValue: return Format.Size.mediumSmall
            case Radius.medium.rawValue: return Format.Size.medium
            case Radius.mediumLarge.rawValue: return Format.Size.mediumLarge
            case Radius.large.rawValue: return Format.Size.large
            case Radius.extraLarge.rawValue: return Format.Size.extraLarge
            case Radius.title.rawValue: return Format.Size.title
            default: return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch size {
            case Size.zero: return NSNumber(CGFloat.zero)
            case Size.extraSmall: return NSNumber(Radius.extraSmall.rawValue)
            case Size.small: return NSNumber(Radius.small.rawValue)
            case Size.mediumSmall: return NSNumber(Radius.mediumSmall.rawValue)
            case Size.medium: return NSNumber(Radius.medium.rawValue)
            case Size.mediumLarge: return NSNumber(Radius.mediumLarge.rawValue)
            case Size.large: return NSNumber(Radius.large.rawValue)
            case Size.extraLarge: return NSNumber(Radius.extraLarge.rawValue)
            case Size.title: return NSNumber(Radius.title.rawValue)
            }
        }
    }
    
    public struct ShadowDescription {
        public let on: Bool
        public let cornerRadius: CGFloat
        public let shadowColor: CGColor
        public let shadowOffset: CGSize
        public let shadowOpacity: Float

        init(on: Bool?, cornerRadius: CGFloat?, shadowColor: UIColor?, shadowOffset: CGSize?, shadowOpacity: CGFloat?) {
            self.on = on ?? true
            self.cornerRadius = cornerRadius ?? Format.Radius.medium.rawValue
            self.shadowColor = (shadowColor ?? UIColor.black).cgColor
            self.shadowOffset = shadowOffset ?? CGSize(width: 0.5, height: 0.5)
            self.shadowOpacity = Float(shadowOpacity ?? 1.0/3.0)
        }
    }
    
    public enum Size: Int {
        case zero
        case extraSmall
        case small
        case mediumSmall
        case medium
        case mediumLarge
        case large
        case extraLarge
        case title
    }
    
    public enum Time {
        public enum Animation: TimeInterval, Sizable {
            case zero = 0
            case extraShort = 0.1
            case short = 0.2
            case mediumShort = 0.3
            case medium = 0.4
            case mediumLong = 0.6
            case long = 0.8
            case extraLong = 1.0
            
            static public func size(from number: NSNumber) -> Format.Size {
                switch number.doubleValue {
                case Time.Animation.zero.rawValue: return Format.Size.zero
                case Time.Animation.extraShort.rawValue: return Format.Size.extraSmall
                case Time.Animation.short.rawValue: return Format.Size.small
                case Time.Animation.mediumShort.rawValue: return Format.Size.mediumSmall
                case Time.Animation.medium.rawValue: return Format.Size.medium
                case Time.Animation.mediumLong.rawValue: return Format.Size.mediumLarge
                case Time.Animation.long.rawValue: return Format.Size.large
                case Time.Animation.extraLong.rawValue: return Format.Size.extraLarge
                default:
                    return Format.Size.zero
                }
            }
            
            static public func number(from size: Format.Size) -> NSNumber {
                switch size {
                case Format.Size.zero: return NSNumber(Time.Animation.zero.rawValue)
                case Format.Size.extraSmall: return NSNumber(Time.Animation.extraShort.rawValue)
                case Format.Size.small: return NSNumber(Time.Animation.short.rawValue)
                case Format.Size.mediumSmall: return NSNumber(Time.Animation.mediumShort.rawValue)
                case Format.Size.medium: return NSNumber(Time.Animation.medium.rawValue)
                case Format.Size.mediumLarge: return NSNumber(Time.Animation.mediumLong.rawValue)
                case Format.Size.large: return NSNumber(Time.Animation.long.rawValue)
                case Format.Size.extraLarge: return NSNumber(Time.Animation.extraLong.rawValue)
                default: return NSNumber(Time.Animation.zero.rawValue)
                }
            }
        }
        
        public enum Interval: TimeInterval {
            case zero = 0
            case minute = 60
            case hour = 3600
            case day = 86400
            case week = 604800
            case month = 2592000
            case year = 31536000
            case twelveHours = 43200
            case timeBuffer = 14400 // 4 * 60 * 60
            
            static func interval(seconds: Double) -> Interval {
                switch seconds {
                case zero.rawValue: return Interval.zero
                case minute.rawValue: return Interval.minute
                case hour.rawValue: return Interval.hour
                case day.rawValue: return Interval.day
                case week.rawValue: return Interval.week
                case month.rawValue: return Interval.month
                case year.rawValue: return Interval.year
                default:
                    if (seconds <= Interval.zero.rawValue) { return Interval.zero }
                    else if (seconds <= Interval.minute.rawValue) { return Interval.minute }
                    else if (seconds <= Interval.hour.rawValue) { return Interval.hour }
                    else if (seconds <= Interval.day.rawValue) { return Interval.day }
                    else if (seconds <= Interval.week.rawValue) { return Interval.week }
                    else if (seconds <= Interval.month.rawValue) { return Interval.month }
                    else { return Interval.year }
                }
            }
            
            static func string(interval: Interval) -> String {
                return string(interval: interval, capitalized: false, singular: false)
            }
            
            static func string(interval: Interval, capitalized: Bool) -> String {
                return string(interval: interval, capitalized: capitalized, singular: false)
            }
            
            static func string(interval: Interval, singular: Bool) -> String {
                return string(interval: interval, capitalized: false, singular: singular)
            }
            
            static func string(interval: Interval, capitalized: Bool, singular: Bool) -> String {
                var string: String = ""
                switch interval {
                case .zero: string = capitalized ? "Zero" : "zero"
                case .minute: string = capitalized ? "Minute" : "minute"
                case .hour: string = capitalized ? "Hour" : "hour"
                case .day: string = capitalized ? "Day" : "day"
                case .week: string = capitalized ? "Week" : "week"
                case .month: string = capitalized ? "Month" : "month"
                default: string = capitalized ? "Error" : "error"
                }
                let suffix = string.lowercased() == "zero" ? "es" : "s"
                return singular == true ? string : string + suffix
            }
        }
    }
    
    public enum UI {
        public enum Height: CGFloat {
            case bar = 96
            case button = 80
            case categoriesCollection = 172
            case colorSelect = 164
            case graph = 108
            case square = 18
        }
        
        public enum Width: CGFloat {
            case categoriesCollection = 192
        }
    }
}
