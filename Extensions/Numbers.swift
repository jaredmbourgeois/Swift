//
//  Extensions/Numerics.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation
import CoreGraphics

extension CGFloat {
    public static let zero: CGFloat = 0
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
    
    public struct MaxMin {
        let max: CGFloat
        let min: CGFloat
    }
}

extension Double {
    init(_ string: String?, defaultValue: Double = 0) {
        if let string = string,
           let doubleString = Double(string) {
            self = doubleString
        } else {
            self = defaultValue
        }
    }
    
    public static let zero: Double = 0
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
    
    public struct MaxMin {
        let max: Double
        let min: Double
    }
}

extension Int {
    public static let zero: Int = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int>.size)
    }
    
    public struct MaxMin {
        let max: Int
        let min: Int
    }
}

extension Int8 {
    public static let zero: Int8 = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int8>.size)
    }
    
    public struct MaxMin {
        let max: Int8
        let min: Int8
    }
}

extension Int16 {
    public static let zero: Int16 = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int16>.size)
    }
    
    public struct MaxMin {
        let max: Int16
        let min: Int16
    }
}

extension Int32 {
    public static let zero: Int32 = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int32>.size)
    }
    
    public struct MaxMin {
        let max: Int32
        let min: Int32
    }
}

extension Int64 {
    public static let zero: Int64 = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<Int64>.size)
    }
    
    public struct MaxMin {
        let max: Int64
        let min: Int64
    }
}

extension NSNumber {
    convenience init(_ cgFloat: CGFloat) { self.init(value: Double(cgFloat)) }
    convenience init(_ int: Int) { self.init(value: int) }
    convenience init(_ int8: Int8) { self.init(value: int8) }
    convenience init(_ int16: Int16) { self.init(value: int16) }
    convenience init(_ int32: Int32) { self.init(value: int32) }
    convenience init(_ int64: Int64) { self.init(value: int64) }
    convenience init(_ timeInterval: TimeInterval) { self.init(value: timeInterval) }
    public var cgFloatValue: CGFloat { CGFloat(truncating: self)}
}

extension UInt {
    public static let zero: UInt  = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt>.size)
    }
    
    public struct MaxMin {
        let max: UInt
        let min: UInt
    }
}

extension UInt8 {
    public static let zero: UInt8 = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt8>.size)
    }
    
    public struct MaxMin {
        let max: UInt8
        let min: UInt8
    }
}

extension UInt16 {
    public static let zero: UInt16  = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt16>.size)
    }
    public struct MaxMin {
        let max: UInt16
        let min: UInt16
    }
}

extension UInt32 {
    public static let zero: UInt32  = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt32>.size)
    }
    
    public struct MaxMin {
        let max: UInt32
        let min: UInt32
    }
}

extension UInt64 {
    public static let zero: UInt64  = 0
    public var string: String { "\(self)" }
    public var data: Data {
        var value = self
        return Data(bytes: &value, count: MemoryLayout<UInt64>.size)
    }
    
    public struct MaxMin {
        let max: UInt64
        let min: UInt64
    }
}
