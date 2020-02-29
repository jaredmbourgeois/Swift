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

extension NSNumber {
    convenience init(_ cgFloat: CGFloat) {
        self.init(value: Double(cgFloat))
    }
    convenience init(_ int: Int) {
        self.init(value: int)
    }
    convenience init(_ int8: Int8) {
        self.init(value: int8)
    }
    convenience init(_ int16: Int16) {
        self.init(value: int16)
    }
    convenience init(_ int32: Int32) {
        self.init(value: int32)
    }
    convenience init(_ int64: Int64) {
        self.init(value: int64)
    }
    convenience init(_ timeInterval: TimeInterval) {
        self.init(value: timeInterval)
    }
    public var cgFloatValue: CGFloat { CGFloat(truncating: self)}
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
