//
//  Format.swift
//  Jared Bourgeois
//
//  Created by Jared Bourgeois on 12/16/19.
//  Copyright © 2019 Jared Bourgeois. All rights reserved.
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
    
    public enum Font {
        public static func font(name: Font.Name, size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
            switch (name) {
            case .arial:
                return arial(size: size, style: style, modifier: modifier)
            case .avenir:
                return avenir(size: size, style: style, modifier: modifier)
            case .courierNew:
                return courierNew(size: size, style: style, modifier: modifier)
            case .helveticaNeue:
                return helveticaNeue(size: size, style: style, modifier: modifier)
            case .trebuchet:
                return trebuchet(size: size, style: style, modifier: modifier)
            }
        }
        
        public enum Name: String {
            case arial = "Arial"
            case avenir = "Avenir"
            case courierNew = "CourierNewPS"
            case helveticaNeue = "HelveticaNeue"
            case trebuchet = "Trebuchet"
        }
        
        public enum Style: String {
            case thin = "Thin"
            case ultraLight = "UltraLight"
            case light = "Light"
            case regular = "Regular"
            case medium = "Medium"
            case semiBold = "SemiBold"
            case bold = "Bold"
        }
        
        public enum Modifier: String {
            case none = ""
            case italic = "Italic"
        }
        
        public enum Size: CGFloat, Sizable {
            static func size(from number: NSNumber) -> Format.Size {
                switch (number.intValue) {
                case Size.zero.rawValue.toInt():
                    return Format.Size.zero
                case Size.extraSmall.rawValue.toInt():
                    return Format.Size.extraSmall
                case Size.small.rawValue.toInt():
                    return Format.Size.small
                case Size.mediumSmall.rawValue.toInt():
                    return Format.Size.mediumSmall
                case Size.medium.rawValue.toInt():
                    return Format.Size.medium
                case Size.mediumLarge.rawValue.toInt():
                    return Format.Size.mediumLarge
                case Size.large.rawValue.toInt():
                    return Format.Size.large
                case Size.extraLarge.rawValue.toInt():
                    return Format.Size.extraLarge
                case Size.title.rawValue.toInt():
                    return Format.Size.title
                default:
                    return Format.Size.zero
                }
            }
            
            static func number(from size: Format.Size) -> NSNumber {
                switch (size) {
                case Format.Size.zero:
                    return CGFloat.zero.toNSNumber()
                case Format.Size.extraSmall:
                    return Font.Size.extraSmall.rawValue.toNSNumber()
                case Format.Size.small:
                    return Font.Size.small.rawValue.toNSNumber()
                case Format.Size.mediumSmall:
                    return Font.Size.mediumSmall.rawValue.toNSNumber()
                case Format.Size.medium:
                    return Font.Size.medium.rawValue.toNSNumber()
                case Format.Size.mediumLarge:
                    return Font.Size.mediumLarge.rawValue.toNSNumber()
                case Format.Size.large:
                    return Font.Size.large.rawValue.toNSNumber()
                case Format.Size.extraLarge:
                    return Font.Size.extraLarge.rawValue.toNSNumber()
                case Format.Size.title:
                    return Font.Size.title.rawValue.toNSNumber()
                }
            }
            
            case zero = 0
            case extraSmall = 10
            case small = 12
            case mediumSmall = 16
            case medium = 20
            case mediumLarge = 24
            case large = 32
            case extraLarge = 36
            case title = 42
        }
        
        private static func arial(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
            let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
            let fontName: String
            switch style {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Name.arial.rawValue + "-" + Font.Modifier.italic.rawValue + "MT" :
                    Name.arial.rawValue + "MT"
                break
            case .semiBold, .bold:
                fontName = Name.arial.rawValue + "-" + Font.Style.bold.rawValue + modifier.rawValue + "MT"
                break
            }
            return UIFont.init(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
        
        private static func avenir(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
            let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
            var fontName: String
            switch style {
            case .thin, .ultraLight, .light:
                fontName = Font.Name.avenir.rawValue + "-" + Font.Style.light.rawValue
                break
            case .regular:
                fontName = Font.Name.avenir.rawValue + "-" + "Book"
                break
            case .medium:
                fontName = Font.Name.avenir.rawValue + "-" + Font.Style.medium.rawValue
                break
            case .semiBold:
                fontName = Font.Name.avenir.rawValue + "-" + "Heavy"
                break
            case .bold:
                fontName = Font.Name.avenir.rawValue + "-" + "Black"
                break
            }
            fontName = modifier == Font.Modifier.italic ? fontName + "Oblique" : fontName
            return UIFont.init(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
        
        private static func courierNew(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
            let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
            var fontName: String = Font.Name.courierNew.rawValue
            switch style {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Name.courierNew.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Name.courierNew.rawValue
                break
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    Name.courierNew.rawValue + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    Name.courierNew.rawValue + "-" + Font.Style.bold.rawValue
                break
            }
            fontName = fontName + "MT"
            return UIFont.init(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
        
        private static func helveticaNeue(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
            let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
            var fontName: String = Font.Name.helveticaNeue.rawValue
            switch style {
            case .thin:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.thin.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.thin.rawValue
                break
            case .ultraLight:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.ultraLight.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.ultraLight.rawValue
                break
            case .light:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.light.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.light.rawValue
                break
            case .regular:
                if (modifier == Font.Modifier.italic) {
                    fontName = fontName + "-" + Font.Modifier.italic.rawValue
                }
                break
            case .medium:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.medium.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.medium.rawValue
                break
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.bold.rawValue
                break
            }
            return UIFont.init(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
        
        private static func trebuchet(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
            let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
            let fontName: String
            switch style {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == .italic ?
                    Font.Name.trebuchet.rawValue + "MS" + "-" + Font.Modifier.italic.rawValue :
                    Font.Name.trebuchet.rawValue + "MS"
                break
            case .semiBold, .bold:
                fontName = modifier == .italic ?
                    Font.Name.trebuchet.rawValue + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.Name.trebuchet.rawValue + "MS" + "-" + Font.Style.bold.rawValue
                break
            }
            return UIFont.init(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        }
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
        
        static func size(from number: NSNumber) -> Format.Size {
            switch (number.doubleValue) {
            case Height.zero.rawValue.toDouble():
                return Format.Size.zero
            case Height.extraSmall.rawValue.toDouble():
                return Format.Size.extraSmall
            case Height.small.rawValue.toDouble():
                return Format.Size.small
            case Height.mediumSmall.rawValue.toDouble():
                return Format.Size.mediumSmall
            case Height.medium.rawValue.toDouble():
                return Format.Size.medium
            case Height.mediumLarge.rawValue.toDouble():
                return Format.Size.mediumLarge
            case Height.large.rawValue.toDouble():
                return Format.Size.large
            case Height.extraLarge.rawValue.toDouble():
                return Format.Size.extraLarge
            case Height.title.rawValue.toDouble():
                return Format.Size.title
            default:
                return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch (size) {
            case Size.zero:
                return CGFloat.zero.toNSNumber()
            case Size.extraSmall:
                return Height.extraSmall.rawValue.toNSNumber()
            case Size.small:
                return Height.small.rawValue.toNSNumber()
            case Size.mediumSmall:
                return Height.mediumSmall.rawValue.toNSNumber()
            case Size.medium:
                return Height.medium.rawValue.toNSNumber()
            case Size.mediumLarge:
                return Height.mediumLarge.rawValue.toNSNumber()
            case Size.large:
                return Height.large.rawValue.toNSNumber()
            case Size.extraLarge:
                return Height.extraLarge.rawValue.toNSNumber()
            case Size.title:
                return Height.title.rawValue.toNSNumber()
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
        
        static func size(from number: NSNumber) -> Format.Size {
            switch (number.doubleValue) {
            case Inset.zero.rawValue.toDouble():
                return Format.Size.zero
            case Inset.extraSmall.rawValue.toDouble():
                return Format.Size.extraSmall
            case Inset.small.rawValue.toDouble():
                return Format.Size.small
            case Inset.mediumSmall.rawValue.toDouble():
                return Format.Size.mediumSmall
            case Inset.medium.rawValue.toDouble():
                return Format.Size.medium
            case Inset.mediumLarge.rawValue.toDouble():
                return Format.Size.mediumLarge
            case Inset.large.rawValue.toDouble():
                return Format.Size.large
            case Inset.extraLarge.rawValue.toDouble():
                return Format.Size.extraLarge
            case Inset.title.rawValue.toDouble():
                return Format.Size.title
            default:
                return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch (size) {
            case Size.zero:
                return CGFloat.zero.toNSNumber()
            case Size.extraSmall:
                return Inset.extraSmall.rawValue.toNSNumber()
            case Size.small:
                return Inset.small.rawValue.toNSNumber()
            case Size.mediumSmall:
                return Inset.mediumSmall.rawValue.toNSNumber()
            case Size.medium:
                return Inset.medium.rawValue.toNSNumber()
            case Size.mediumLarge:
                return Inset.mediumLarge.rawValue.toNSNumber()
            case Size.large:
                return Inset.large.rawValue.toNSNumber()
            case Size.extraLarge:
                return Inset.extraLarge.rawValue.toNSNumber()
            case Size.title:
                return Inset.title.rawValue.toNSNumber()
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
        
        static func size(from number: NSNumber) -> Format.Size {
            switch (number.doubleValue) {
            case LineWidth.zero.rawValue.toDouble():
                return Format.Size.zero
            case LineWidth.extraSmall.rawValue.toDouble():
                return Format.Size.extraSmall
            case LineWidth.small.rawValue.toDouble():
                return Format.Size.small
            case LineWidth.mediumSmall.rawValue.toDouble():
                return Format.Size.mediumSmall
            case LineWidth.medium.rawValue.toDouble():
                return Format.Size.medium
            case LineWidth.mediumLarge.rawValue.toDouble():
                return Format.Size.mediumLarge
            case LineWidth.large.rawValue.toDouble():
                return Format.Size.large
            case LineWidth.extraLarge.rawValue.toDouble():
                return Format.Size.extraLarge
            case LineWidth.title.rawValue.toDouble():
                return Format.Size.title
            default:
                return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch (size) {
            case Size.zero:
                return CGFloat.zero.toNSNumber()
            case Size.extraSmall:
                return LineWidth.extraSmall.rawValue.toNSNumber()
            case Size.small:
                return LineWidth.small.rawValue.toNSNumber()
            case Size.mediumSmall:
                return LineWidth.mediumSmall.rawValue.toNSNumber()
            case Size.medium:
                return LineWidth.medium.rawValue.toNSNumber()
            case Size.mediumLarge:
                return LineWidth.mediumLarge.rawValue.toNSNumber()
            case Size.large:
                return LineWidth.large.rawValue.toNSNumber()
            case Size.extraLarge:
                return LineWidth.extraLarge.rawValue.toNSNumber()
            case Size.title:
                return LineWidth.title.rawValue.toNSNumber()
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
        
        static func size(from number: NSNumber) -> Format.Size {
            switch (number.doubleValue) {
            case Radius.zero.rawValue.toDouble():
                return Format.Size.zero
            case Radius.extraSmall.rawValue.toDouble():
                return Format.Size.extraSmall
            case Radius.small.rawValue.toDouble():
                return Format.Size.small
            case Radius.mediumSmall.rawValue.toDouble():
                return Format.Size.mediumSmall
            case Radius.medium.rawValue.toDouble():
                return Format.Size.medium
            case Radius.mediumLarge.rawValue.toDouble():
                return Format.Size.mediumLarge
            case Radius.large.rawValue.toDouble():
                return Format.Size.large
            case Radius.extraLarge.rawValue.toDouble():
                return Format.Size.extraLarge
            case Radius.title.rawValue.toDouble():
                return Format.Size.title
            default:
                return Format.Size.zero
            }
        }

        public static func number(from size: Size) -> NSNumber {
            switch (size) {
            case Size.zero:
                return CGFloat.zero.toNSNumber()
            case Size.extraSmall:
                return Radius.extraSmall.rawValue.toNSNumber()
            case Size.small:
                return Radius.small.rawValue.toNSNumber()
            case Size.mediumSmall:
                return Radius.mediumSmall.rawValue.toNSNumber()
            case Size.medium:
                return Radius.medium.rawValue.toNSNumber()
            case Size.mediumLarge:
                return Radius.mediumLarge.rawValue.toNSNumber()
            case Size.large:
                return Radius.large.rawValue.toNSNumber()
            case Size.extraLarge:
                return Radius.extraLarge.rawValue.toNSNumber()
            case Size.title:
                return Radius.title.rawValue.toNSNumber()
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
            
            static func size(from number: NSNumber) -> Format.Size {
                switch number.doubleValue {
                case Time.Animation.zero.rawValue:
                    return Format.Size.zero
                case Time.Animation.extraShort.rawValue:
                    return Format.Size.extraSmall
                case Time.Animation.short.rawValue:
                    return Format.Size.small
                case Time.Animation.mediumShort.rawValue:
                    return Format.Size.mediumSmall
                case Time.Animation.medium.rawValue:
                    return Format.Size.medium
                case Time.Animation.mediumLong.rawValue:
                    return Format.Size.mediumLarge
                case Time.Animation.long.rawValue:
                    return Format.Size.large
                case Time.Animation.extraLong.rawValue:
                    return Format.Size.extraLarge
                default:
                    return Format.Size.zero
                }
            }
            
            static func number(from size: Format.Size) -> NSNumber {
                switch size {
                case Format.Size.zero:
                    return Time.Animation.zero.rawValue.toNSNumber()
                case Format.Size.extraSmall:
                    return Time.Animation.extraShort.rawValue.toNSNumber()
                case Format.Size.small:
                    return Time.Animation.short.rawValue.toNSNumber()
                case Format.Size.mediumSmall:
                    return Time.Animation.mediumShort.rawValue.toNSNumber()
                case Format.Size.medium:
                    return Time.Animation.medium.rawValue.toNSNumber()
                case Format.Size.mediumLarge:
                    return Time.Animation.mediumLong.rawValue.toNSNumber()
                case Format.Size.large:
                    return Time.Animation.long.rawValue.toNSNumber()
                case Format.Size.extraLarge:
                    return Time.Animation.extraLong.rawValue.toNSNumber()
                default:
                    return Time.Animation.zero.rawValue.toNSNumber()
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
                case zero.rawValue:
                    return Interval.zero
                case minute.rawValue:
                    return Interval.minute
                case hour.rawValue:
                    return Interval.hour
                case day.rawValue:
                    return Interval.day
                case week.rawValue:
                    return Interval.week
                case month.rawValue:
                    return Interval.month
                case year.rawValue:
                    return Interval.year
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
                case .zero:
                    string = capitalized ? "Zero" : "zero"
                    break
                case .minute:
                    string = capitalized ? "Minute" : "minute"
                    break
                case .hour:
                    string = capitalized ? "Hour" : "hour"
                    break
                case .day:
                    string = capitalized ? "Day" : "day"
                    break
                case .week:
                    string = capitalized ? "Week" : "week"
                    break
                case .month:
                    string = capitalized ? "Month" : "month"
                    break
                default:
                    string = capitalized ? "Error" : "error"
                    break
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
