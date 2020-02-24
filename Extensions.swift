//
//  Extensions.swift
//  Jared Bourgeois
//
//  Created by  Jared on 12/16/19.
//  Copyright © 2020 Jared Bourgeois. All rights reserved.
//

import UIKit
import CoreData 
import CoreGraphics

extension CALayer {
    public func shadow(_ description: Format.ShadowDescription) -> Void {
        CALayer.shadow(self, cornerRadius: description.cornerRadius, color: description.shadowColor, offset: description.shadowOffset, opacity: description.shadowOpacity)
    }
    public static func shadow(_ layer: CALayer, description: Format.ShadowDescription) -> Void {
        CALayer.shadow(layer, cornerRadius: description.cornerRadius, color: description.shadowColor, offset: description.shadowOffset, opacity: description.shadowOpacity)
    }
    public func shadow() -> Void {
        CALayer.shadow(self, cornerRadius: nil, color: nil, offset: nil, opacity: nil)
    }
    public func shadow(cornerRadius: CGFloat?, color: CGColor?, offset: CGSize?, opacity: Float?) -> Void {
        CALayer.shadow(self, cornerRadius: cornerRadius, color: color, offset: offset, opacity: opacity)
    }
    public static func shadow(_ layer: CALayer) -> Void {
        CALayer.shadow(layer, cornerRadius: nil, color: nil, offset: nil, opacity: nil)
    }
    public static func shadow(_ layer: CALayer, cornerRadius: CGFloat?, color: CGColor?, offset: CGSize?, opacity: Float?) -> Void {
        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius ?? 6
        layer.shadowColor = color ?? UIColor.StackOverflow.black.cgColor
        layer.shadowOffset = offset ?? CGSize(width: 0.5, height: 0.5)
        layer.shadowOpacity = opacity ?? Float(1.0/3.0)
    }
}


extension Calendar {
    public static var current: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        calendar.locale = .current
        return calendar
    }
    
    public static func dateComponents(calendar: Calendar? = nil, date: Date, calendarComponents: Set<Calendar.Component>) -> DateComponents {
        let calendar: Calendar = calendar ?? Calendar.current
        let dateComponents: DateComponents = calendar.dateComponents(calendarComponents, from: date)
        return dateComponents
    }
}


extension CGFloat {
    public static var zero: CGFloat { CGFloat(0) }
    public var string: String { "\(self)" }

    public func interpolate(_ value: CGFloat) -> CGFloat {
        return CGFloat.interpolate(self, value)
    }
    
    public static func interpolate(_ firstValue: CGFloat, _ secondValue: CGFloat) -> CGFloat {
        return 0.5 * (firstValue + secondValue)
    }
    
    public static func stringWith(value: CGFloat, decimals: Int, formatter: NumberFormatter = NumberFormatter()) -> String {
        Double.stringWith(value: Double(value), decimals: decimals, formatter: formatter)
    }
}


extension CGPath {
        
    public static func rounded(rect: CGRect, cornerRadius: CGFloat = Format.Radius.medium.rawValue, lineWidth: CGFloat = CGFloat.zero, position: Format.Position = .isolated) -> CGPath {
        let mutablePath: CGMutablePath = CGMutablePath()
        let margin: CGFloat = 0.5*lineWidth
        let topLeft: CGPoint = CGPoint(x: rect.minX + margin, y: rect.minY + margin)
        let topRight: CGPoint = CGPoint(x: rect.maxX - margin, y: rect.minY + margin)
        let bottomLeft: CGPoint = CGPoint(x: rect.minX + margin, y: rect.maxY - margin)
        let bottomRight: CGPoint = CGPoint(x: rect.maxX - margin, y: rect.maxY - margin)
        let radius: CGFloat
        
        switch position {
        case .top:
            radius = cornerRadius
            mutablePath.move(to: bottomLeft)
            mutablePath.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + radius))
            mutablePath.addRelativeArc(center: CGPoint(x: topLeft.x + radius, y: topLeft.y + radius), radius: radius, startAngle: .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: topRight.x - radius, y: topRight.y + radius), radius: radius, startAngle: (3.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: bottomRight)
            mutablePath.addLine(to: bottomLeft)
            break
            
        case .middle:
            radius = 0
            mutablePath.addRelativeArc(center: CGPoint(x: topLeft.x + radius, y: topLeft.y + radius), radius: radius, startAngle: .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: topRight.x - radius, y: topRight.y + radius), radius: radius, startAngle: (3.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomRight.x - radius, y: bottomRight.y - radius), radius: radius, startAngle: 0, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y - radius), radius: radius, startAngle: (1.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + radius))
            break
            
        case .bottom:
            radius = cornerRadius
            mutablePath.move(to: topLeft)
            mutablePath.addLine(to: topRight)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomRight.x - radius, y: bottomRight.y - radius), radius: radius, startAngle: 0, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y - radius), radius: radius, startAngle: (1.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: topLeft)
            break
            
        case .left:
            radius = cornerRadius
            mutablePath.move(to: topRight)
            mutablePath.addLine(to: bottomRight)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y - radius), radius: radius, startAngle: (1.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: topLeft.x + radius, y: topLeft.y + radius), radius: radius, startAngle: .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: topRight)
            break
            
        case .right:
            radius = cornerRadius
            mutablePath.move(to: topLeft)
            mutablePath.addLine(to: bottomLeft)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomRight.x - radius, y: bottomRight.y - radius), radius: radius, startAngle: (1.0/2.0) * .pi, delta: -(1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: topRight.x - radius, y: topRight.y + radius), radius: radius, startAngle: 0, delta: -(1.0/2.0) * .pi)
            mutablePath.addLine(to: topLeft)
            break
            
        case .isolated:
            radius = cornerRadius
            mutablePath.addRelativeArc(center: CGPoint(x: topLeft.x + radius, y: topLeft.y + radius), radius: radius, startAngle: .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: topRight.x - radius, y: topRight.y + radius), radius: radius, startAngle: (3.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomRight.x - radius, y: bottomRight.y - radius), radius: radius, startAngle: 0, delta: (1.0/2.0) * .pi)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y - radius), radius: radius, startAngle: (1.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + radius))
            break
        }
        return mutablePath.copy()!
    }
    
    public static func checkmark(rect: CGRect) -> CGPath {
        let x: (left: CGFloat, middle: CGFloat, right: CGFloat) = (left: (4.5/32.0), middle: (12.5/32.0), right: (26.0/32.0))
        let y: (top: CGFloat, middle: CGFloat, bottom: CGFloat) = (top: (7.0/32.0), middle: (15.5/32.0), bottom: (23.0/32.0))

        let mutablePath: CGMutablePath = CGMutablePath()
        mutablePath.move(to: CGPoint(x: rect.origin.x + x.left * rect.size.width, y: rect.origin.y + y.middle * rect.size.height))
        mutablePath.addLine(to: CGPoint(x: rect.origin.x + x.middle * rect.size.width, y: rect.origin.y + y.bottom * rect.size.height))
        mutablePath.addLine(to: CGPoint(x: rect.origin.x + x.right * rect.size.width, y: rect.origin.y + y.top * rect.size.height))
        return mutablePath.copy()!
    }
}


extension CGRect {
    public var center: CGPoint { CGPoint(x: self.origin.x + 0.5 * self.size.width, y: self.origin.y + 0.5 * self.size.height) }
}


extension CGSize {
    public var max: CGFloat { self.width > self.height ? self.width : self.height }
    public var min: CGFloat { self.width > self.height ? self.height : self.width }
    public var aspectRatio: CGFloat { CGFloat( self.width / self.height ) }
    public var slope: CGFloat { CGFloat( self.height / self.width ) }
    public func scaleHeight(by width: CGFloat) -> CGFloat { self.height *  width / self.width }
    public func scaleWidth(by height: CGFloat) -> CGFloat { self.width * height / self.height }
}


extension Data {
    public static var empty: Data { Data() }
}


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


extension DateFormatter {
    enum Symbol {
        case normal
        case short
        case veryShort
    }
    
    func symbols(timePeriod: Date.TimePeriod, symbol: Symbol = .normal) -> [String]? {
        return DateFormatter.symbols(
            dateFormatter: self,
            timePeriod: timePeriod,
            symbol: symbol
        )
    }
    
    static func symbols(dateFormatter: DateFormatter? = nil, timePeriod: Date.TimePeriod = .weekday, symbol: Symbol = .normal) -> [String]? {
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
        timePeriod: Date.TimePeriod = .weekday,
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
        timePeriod: Date.TimePeriod = .weekday,
        symbol: Symbol = .normal
    ) -> String {
        let components: DateComponents = Calendar.dateComponents(calendar: calendar, date: date, calendarComponents: [timePeriod.dateComponent])
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


extension Double {
    public static var zero: Double { Double(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Double>.size)
    }
    
    func interpolate(_ value: Double) -> Double {
        Double.interpolate(self, value)
    }
    
    static func interpolate(_ firstValue: Double, _ secondValue: Double) -> Double {
        0.5 * (firstValue + secondValue)
    }

    func stringWith(decimals: Int, formatter: NumberFormatter = NumberFormatter()) -> String {
        Double.stringWith(value: self, decimals: decimals, formatter: formatter)
    }
    
    static func stringWith(value: Double, decimals: Int, formatter: NumberFormatter = NumberFormatter()) -> String {
        formatter.minimumFractionDigits = decimals
        formatter.maximumFractionDigits = decimals
        return formatter.string(from: value as NSNumber) ?? value.description
    }
}


extension Int {
    public static var zero: Int { Int(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int>.size)
    }
}


extension Int8 {
    public static var zero: Int8 { Int8(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int8>.size)
    }    
}


extension Int16 {
    public static var zero: Int16 { Int16(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int16>.size)
    }
}


extension Int32 {
    public static var zero: Int32 { Int32(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int32>.size)
    }
}


extension Int64 {
    public static var zero: Int64 { Int64(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int64>.size)
    }
}


extension NSAttributeDescription {
    public static func attributeDescription(isOptional: Bool = true, isTransient: Bool = false, name: String, allowsExternalBinaryDataStorage: Bool = false, attributeType: NSAttributeType = .binaryDataAttributeType, defaultValue: Any? = nil, preservesValueInHistoryOnDeletion: Bool = false) -> NSAttributeDescription {
        let attributeDescription: NSAttributeDescription = NSAttributeDescription()
        attributeDescription.isOptional = isOptional // NSPropertyDescription
        attributeDescription.isTransient = isTransient
        attributeDescription.name = name
        attributeDescription.allowsExternalBinaryDataStorage = allowsExternalBinaryDataStorage //NSAttributeDescription
        attributeDescription.attributeType = attributeType
        attributeDescription.defaultValue = defaultValue
        attributeDescription.preservesValueInHistoryOnDeletion = preservesValueInHistoryOnDeletion
        return attributeDescription
    }
}


extension NSManagedObject {
    public static func fetchObject<T:NSManagedObject>(context: NSManagedObjectContext, key: String, value: String) -> T? {
        fetchObjects(context: context, key: key, value: value)?[0]
    }
    
    public static func fetchObjects<T:NSManagedObject>(context: NSManagedObjectContext, key: String, value: String) -> [T]? {
        fetchObjects(context: context, predicateConditions: [NSPredicate.Condition(key: key, relation: .equal, value: value)])
    }
    
    public static func fetchObject<T: NSManagedObject>(context: NSManagedObjectContext, predicateConditions: [NSPredicate.Condition]? = nil, sortKeyAscendings: [(String, Bool)]? = nil) -> T? {
        fetchObjects(context: context, predicateConditions: predicateConditions, sortKeyAscendings: sortKeyAscendings)?[0]
    }
    
    public static func fetchObjects<T: NSManagedObject>(context: NSManagedObjectContext, predicateConditions: [NSPredicate.Condition]? = nil, sortKeyAscendings: [(String, Bool)]? = nil) -> [T]? {
        let request: NSFetchRequest = T.fetchRequest()
        if let predicateConditions: [NSPredicate.Condition] = predicateConditions {
            request.predicate = NSPredicate.from(conditions: predicateConditions)
        }
        if let sortKeyAscendings: [(String, Bool)] = sortKeyAscendings {
            var sortDescriptors: [NSSortDescriptor] = []
            for (sortKey, ascending) in sortKeyAscendings {
                sortDescriptors.append(NSSortDescriptor(key: sortKey, ascending: ascending))
            }
            request.sortDescriptors = sortDescriptors
        }
        let result: [T]
        do {
            result = try context.fetch(request) as! [T]
        } catch {
            fatalError()
        }
        if result.count > 0 {
            return result
        } else {
            return nil
        }
    }
    
    public func saveSucces() -> Bool {
        return saveSuccess(printError: nil)
    }
    public func saveSuccess(printError text: String?) -> Bool {
        return managedObjectContext != nil ? managedObjectContext!.saveSuccess(printError: text) : false
    }
}


extension NSManagedObjectContext {
    public func saveSuccess(printError: String? = nil) -> Bool {
        do {
            try save()
            return true
        } catch let error {
            if let printError = printError { print(printError + "ERROR=" + error.localizedDescription) }
            print("NSManagedObjectContext.saveSuccess() ERROR=" + error.localizedDescription)
            return false
        }
    }
}


extension NSNumber {
    convenience init(_ cgFloat: CGFloat) {
        self.init(value: Double(cgFloat))
    }
    convenience init(_ timeInterval: TimeInterval) {
        self.init(value: timeInterval)
    }
    public var cgFloatValue: CGFloat { CGFloat(truncating: self)}
}


extension NSPredicate {
    public struct Condition {
        let linkWithAnd: Bool = true
        let key: String
        let relation: Relation
        let value: Any
        
        public enum Relation: String {
            case equal = "="
            case notEqual = "!="
            case greaterThan = ">"
            case greaterThanEqualTo = ">="
            case lessThan = "<"
            case lessThanEqualTo = "<="
        }
    }
    
    public static func from(condition: Condition) -> NSPredicate { from(conditions: [condition]) }
    
    public static func from(conditions: [Condition]) -> NSPredicate {
        var string: String = String.empty
        var condition: Condition
        var link: String
        for index: Int in 0 ..< conditions.count {
            condition = conditions[index]
            switch index {
            case 0:
                string += "\(condition.key) \(condition.relation.rawValue) %@"
            default:
                link = condition.linkWithAnd == true ? "&&" : "||"
                string += " \(link) \(condition.key) \(condition.relation.rawValue) %@"
            }
        }
        return NSPredicate(format: string, conditions.map{ $0.value })
    }
}


extension String {
    public static let empty: String = ""
    public static let zero: String = "0"
}


extension UIApplication {
    static func statusBarStyleForBackground(color: UIColor) -> UIStatusBarStyle {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return success == true ?
            (brightness >= 0.5 ?
                UIStatusBarStyle.darkContent : UIStatusBarStyle.lightContent
            ) :
            UIStatusBarStyle.default
    }
}


extension UIButton {
    public static func button() -> UIButton {
        return UIButton.button(title: nil, font: nil, textAlignment: nil, textColor: nil, backgroundColor: nil, cornerRadius: nil)
    }
    
    public static func button(title: String?, font: UIFont?, textAlignment: NSTextAlignment?, textColor: UIColor?, backgroundColor: UIColor?, cornerRadius: CGFloat?) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.showsTouchWhenHighlighted = true
        btn.clipsToBounds = false
        btn.contentMode = .scaleToFill

        btn.backgroundColor = backgroundColor ?? UIColor.red
        btn.layer.cornerRadius = cornerRadius ?? 0
        
        btn.setTitle(title ?? "", for: .normal)
        btn.setTitleColor(textColor ?? UIColor.red, for: .normal)
        btn.titleLabel?.backgroundColor = .clear
        btn.titleLabel?.font = font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        btn.titleLabel?.textAlignment = textAlignment ?? NSTextAlignment.left
        btn.titleLabel?.textColor = textColor ?? UIColor.red
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }
}


extension UIColor {
    public enum Components {
        public struct HSBA {
            let hue: CGFloat
            let saturation: CGFloat
            let brightness: CGFloat
            let alpha: CGFloat
        }
    }
    
    public enum StackOverflow {
        public static var black: UIColor { UIColor(red: CGFloat(25.0/255.0), green: CGFloat(26.0/255.0), blue: CGFloat(28.0/255.0), alpha: 1) }
        public static var blue: UIColor { UIColor(red: CGFloat(14.0/255.0), green: CGFloat(99.0/255.0), blue: CGFloat(194.0/255.0), alpha: 1) }
        public static var bronze: UIColor { UIColor(red: CGFloat(198.0/255.0), green: CGFloat(149.0/255.0), blue: CGFloat(113.0/255.0), alpha: 1) }
        public static var bronzeLight: UIColor { UIColor(red: CGFloat(246.0/255.0), green: CGFloat(228.0/255.0), blue: CGFloat(213.0/255.0), alpha: 1) }
        public static var gold: UIColor { UIColor(red: CGFloat(254.0/255.0), green: CGFloat(195.0/255.0), blue: CGFloat(10.0/255.0), alpha: 1) }
        public static var goldLight: UIColor { UIColor(red: CGFloat(255.0/255.0), green: CGFloat(249.0/255.0), blue: CGFloat(224.0/255.0), alpha: 1) }
        public static var gray: UIColor { UIColor(red: CGFloat(174.0/255.0), green: CGFloat(173.0/255.0), blue: CGFloat(174.0/255.0), alpha: 1) }
        public static var green: UIColor { UIColor(red: CGFloat(80.0/255.0), green: CGFloat(175.0/255.0), blue: CGFloat(106.0/255.0), alpha: 1) }
        public static var highlight: UIColor { UIColor(red: CGFloat(240.0/255.0), green: CGFloat(240.0/255.0), blue: CGFloat(240.0/255.0), alpha: 1) }
        public static var navy: UIColor { UIColor(red: CGFloat(45.0/255.0), green: CGFloat(95.0/255.0), blue: CGFloat(139.0/255.0), alpha: 1) }
        public static var navyLight: UIColor { UIColor(red: CGFloat(218.0/255.0), green: CGFloat(231.0/255.0), blue: CGFloat(241.0/255.0), alpha: 1) }
        public static var orange: UIColor { UIColor(red: CGFloat(239.0/255.0), green: CGFloat(107.0/255.0), blue: CGFloat(28.0/255.0), alpha: 1) }
        public static var silver: UIColor { UIColor(red: CGFloat(165.0/255.0), green: CGFloat(169.0/255.0), blue: CGFloat(174.0/255.0), alpha: 1) }
        public static var silverLight: UIColor { UIColor(red: CGFloat(229.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(231/255.0), alpha: 1) }
    }
    
    public enum Streak {
        public static var blue: UIColor { UIColor(red: 0.07, green: 0.61, blue: 0.85, alpha: 1) }
        public static var orange: UIColor { UIColor(red: 0.95, green: 0.52, blue: 0.19, alpha: 1) }
    }
    
    public func componentsHSBA() -> Components.HSBA { UIColor.componentsHSBA(color: self) }
    public static func componentsHSBA(color: UIColor) -> Components.HSBA {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let _: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return Components.HSBA(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    public func contrasting(with degree: Format.Degree) -> UIColor { UIColor.contrasting(color: self, degree: degree) }
    public static func contrasting(color: UIColor, degree: Format.Degree) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (success == true) {
            let fraction: CGFloat = degree.rawValue
            if (brightness >= 0.5) {
                brightness -= 0.5 * fraction * brightness
            }
            else if (brightness < 0.5){
                brightness += 0.5 * fraction * brightness
            }
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        }
        else {
            return color
        }
    }
    
    public func desaturated(with degree: Format.Degree) -> UIColor { UIColor.desaturated(color: self, degree: degree) }
    public static func desaturated(color: UIColor, degree: Format.Degree) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (success == true) {
            let fraction: CGFloat = 1 - degree.rawValue
            return UIColor(hue: hue, saturation: saturation * fraction, brightness: brightness, alpha: alpha)
        }
        else {
            return color
        }
    }
    
    public func transparent(degree: Format.Degree) -> UIColor { UIColor.transparent(color: self, degree: degree) }
    public static func transparent(color: UIColor, degree: Format.Degree) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (success == true) {
            let fraction: CGFloat = 1 - degree.rawValue
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: fraction)
        }
        else {
            return color
        }
    }
}


extension UIFont {
    public static func font(size: Format.Size, bold: Bool) -> UIFont {
        let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
        let fnt = UIFont(name: "HelveticaNeue-Medium", size: CGFloat(fontSize))!
        
        switch bold {
        case true:
            let descriptor: UIFontDescriptor = fnt.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold)!
            return UIFont(descriptor: descriptor, size: CGFloat(size.rawValue))
            
        case false:
            return fnt
        }
    }
}


extension UIImage {
    public static var empty: UIImage { UIImage() }
}


extension UILabel {
    public static func label(font: UIFont? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment? = nil, numberOfLines: Int? = nil) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .clear
        lbl.isUserInteractionEnabled = false
        lbl.font = font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        lbl.textColor = textColor ?? .red
        lbl.textAlignment = textAlignment ?? .left
        lbl.numberOfLines = numberOfLines ?? 0
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }
}


extension UInt {
    public static var zero: UInt { UInt(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt>.size)
    }
}


extension UInt8 {
    public static var zero: UInt8 { UInt8(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt8>.size)
    }
}


extension UInt16 {
    public static var zero: UInt16 { UInt16(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt16>.size)
    }
}


extension UInt32 {
    public static var zero: UInt32 { UInt32(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt32>.size)
    }
}


extension UInt64 {
    public static var zero: UInt64 { UInt64(0) }
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt64>.size)
    }
}


extension UISplitViewController {
    public struct DismissDetailViewController {
        public typealias HandlerCompletionHandler = () -> Void
        
        public unowned let splitViewController: UISplitViewController
        public let handlerCompletionHandler: HandlerCompletionHandler?
        public let animated: Bool
        
        public init (splitViewController: UISplitViewController, animated: Bool, handlerCompletionHandler: HandlerCompletionHandler?) {
            self.splitViewController = splitViewController
            self.handlerCompletionHandler = handlerCompletionHandler
            self.animated = animated
        }
    }
}


extension UISplitViewControllerDelegate {
    public func dismissDetailViewControllerHandler(_ dismissDetailViewController: UISplitViewController.DismissDetailViewController) -> Void {
        dismissDetailViewController.splitViewController.dismiss(animated: dismissDetailViewController.animated, completion: dismissDetailViewController.handlerCompletionHandler)
    }
}


extension UIScrollView {
    public static func indicatorStyle(matching: Bool, color: UIColor) -> UIScrollView.IndicatorStyle {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return success == true ?
        (brightness >= 0.5 ?
            (matching == true ? .white : .black) :
            (matching == true ? .black : .white)
        ) :
        .default
    }
}


extension UIStackView {
    public func addSpacer() {
        let spacer: UIView = UIView()
        spacer.backgroundColor = .clear
        spacer.clipsToBounds = false
        spacer.isUserInteractionEnabled = false
        spacer.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(spacer)
    }
}


extension UITextField {
    public func addLeftViewImage(named imageName: String) {
        let wrapperView: UIView = UIView(frame: self.leftViewRect(forBounds: bounds))
        wrapperView.clipsToBounds = true
        
        if let image: UIImage = UIImage(named: imageName) {
            let imageView: UIImageView = UIImageView(frame: self.leftViewRect(forBounds: bounds))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            wrapperView.addSubview(imageView)
            imageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5).isActive = true
            imageView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5).isActive = true
            self.leftView = wrapperView
            self.leftViewMode = .always
        }
    }

    public static func textField() -> UITextField { UITextField.textField(font: nil, textColor: nil, textAlignment: nil, numberOfLines: nil) }
    
    public static func textField(font: UIFont?, textColor: UIColor?, textAlignment: NSTextAlignment?, numberOfLines: Int?) -> UITextField {
        let txtField: UITextField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .clear
        txtField.isUserInteractionEnabled = false
        txtField.font = font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        txtField.textColor = textColor ?? .red
        txtField.textAlignment = textAlignment ?? .left
        txtField.tintColor = textColor ?? .red
        txtField.adjustsFontSizeToFitWidth = true
        return txtField
    }
}


extension UIView {
    public func constrainToSuperview() -> Void {
        constrainToSuperview(insetX: 0, insetY: 0)
    }
    
    public func constrainToSuperview(insetX: CGFloat?, insetY: CGFloat?) -> Void {
        if let superView: UIView = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superView.topAnchor, constant: insetY ?? 0),
                bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -(insetY ?? 0)),
                leftAnchor.constraint(equalTo: superView.leftAnchor, constant: insetX ?? 0),
                leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: insetX ?? 0),
                rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -(insetX ?? 0)),
                trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -(insetX ?? 0)),
                widthAnchor.constraint(equalTo: superView.widthAnchor, constant: -2 * (insetX ?? 0)),
                heightAnchor.constraint(equalTo: superView.heightAnchor, constant: -2 * (insetY ?? 0))
            ])
        }
    }
    
    public func destroySubviews() -> Void {
        let oldSubviews = self.subviews
        var subview: UIView?
        for index: Int in 0 ..< oldSubviews.count {
            subview = oldSubviews[index]
            subview?.removeFromSuperview()
            subview = nil
        }
    }
    
    public func removeSubviews() -> Void {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
        
    public static func view(frame: CGRect?, backgroundColor: UIColor?, cornerRadius: CGFloat?) -> UIView {
        let view: UIView = frame != nil ? UIView(frame: frame!) : UIView()
        view.translatesAutoresizingMaskIntoConstraints = frame != nil ? true : false
        view.backgroundColor = backgroundColor ?? UIColor.clear
        view.layer.cornerRadius = cornerRadius ?? 0
        return view
    }
}


extension URL {
    public static let empty: URL = URL(fileURLWithPath: "")
}


extension URLResponse {
    public func isValid(data: Data?, error: Error?) -> Bool {
        return URLResponse.isValid(self, data: data, error: error)
    }
    public static func isValid(_ response: URLResponse?, data: Data?, error: Error?) -> Bool {
        return data != nil && error == nil && response != nil ? true : false
    }
}
