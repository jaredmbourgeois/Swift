//
//  Format.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit
import CoreGraphics

public enum Format {
    public enum AnimationTime: TimeInterval {
        /** 0  */
        case zero = 0
        /** 0.1  */
        case extraShort = 0.1
        /** 0 .2 */
        case short = 0.2
        /** 0 .3 */
        case mediumShort = 0.3
        /** 0.4 */
        case medium = 0.4
        /** 0.6  */
        case mediumLong = 0.6
        /** 0 .8 */
        case long = 0.8
        /** 1  */
        case extraLong = 1.0
    }
    
    public enum Degree: CGFloat {
        /** 0  */
        case none = 0.0
        /** 0. 05 */
        case extraLight = 0.05
        /** 0. 1 */
        case light = 0.1
        /** 0.3 */
        case mediumLight = 0.3
        /** 0. 5 */
        case medium = 0.5
        /** 0. 7 */
        case mediumHigh = 0.7
        /** 0.9  */
        case high = 0.9
        /** 0.95 */
        case extraHigh = 0.95
        /** 1 */
        case all = 1.0
    }
    
    public enum Height: CGFloat, Sizable {
        /** 0  */
        case zero = 0
        /** 16  */
        case extraSmall = 16
        /** 24  */
        case small = 24
        /** 32  */
        case mediumSmall = 32
        /** 42  */
        case medium = 42
        /** 56  */
        case mediumLarge = 56
        /** 64  */
        case large = 64
        /** 72  */
        case extraLarge = 72
        /** 80  */
        case title = 80
        
        public var size: Format.Size {
            switch self {
            case .zero: return .zero
            case .extraSmall: return .extraSmall
            case .small: return .small
            case .mediumSmall: return .mediumSmall
            case .medium: return .medium
            case .mediumLarge: return .mediumLarge
            case .large: return .large
            case .extraLarge: return .extraLarge
            case .title: return .title
            }
        }
        
        public init(_ size: Format.Size) {
            switch size {
            case Size.zero: self = Height.zero
            case Size.extraSmall: self = Height.extraSmall
            case Size.small: self = Height.small
            case Size.mediumSmall: self = Height.mediumSmall
            case Size.medium: self = Height.medium
            case Size.mediumLarge: self = Height.mediumLarge
            case Size.large: self = Height.large
            case Size.extraLarge: self = Height.extraLarge
            case Size.title: self = Height.title
            }
        }
    }

    public enum Inset: CGFloat, Sizable {
        /** 0  */
        case zero = 0
        /** 1  */
        case extraSmall = 1
        /** 2  */
        case small = 2
        /** 4  */
        case mediumSmall = 4
        /** 6  */
        case medium = 6
        /** 8  */
        case mediumLarge = 8
        /** 10  */
        case large = 10
        /** 12  */
        case extraLarge = 12
        /** 16  */
        case title = 16
        
        public var size: Format.Size {
            switch self {
            case .zero: return .zero
            case .extraSmall: return .extraSmall
            case .small: return .small
            case .mediumSmall: return .mediumSmall
            case .medium: return .medium
            case .mediumLarge: return .mediumLarge
            case .large: return .large
            case .extraLarge: return .extraLarge
            case .title: return .title
            }
        }
        
        public init(_ size: Format.Size) {
            switch size {
            case Size.zero: self = Inset.zero
            case Size.extraSmall: self = Inset.extraSmall
            case Size.small: self = Inset.small
            case Size.mediumSmall: self = Inset.mediumSmall
            case Size.medium: self = Inset.medium
            case Size.mediumLarge: self = Inset.mediumLarge
            case Size.large: self = Inset.large
            case Size.extraLarge: self = Inset.extraLarge
            case Size.title: self = Inset.title
            }
        }
    }

    public enum LineWidth: CGFloat, Sizable {
        /** 0 */
        case zero = 0
        /** 0.5 */
        case extraSmall = 0.5
        /** 1 */
        case small = 1
        /** 2 */
        case mediumSmall = 2
        /** 4 */
        case medium = 4
        /** 6 */
        case mediumLarge = 6
        /** 8 */
        case large = 8
        /** 12 */
        case extraLarge = 12
        /** 16 */
        case title = 16
        
        public var size: Format.Size {
            switch self {
            case .zero: return .zero
            case .extraSmall: return .extraSmall
            case .small: return .small
            case .mediumSmall: return .mediumSmall
            case .medium: return .medium
            case .mediumLarge: return .mediumLarge
            case .large: return .large
            case .extraLarge: return .extraLarge
            case .title: return .title
            }
        }
        
        public init(_ size: Format.Size) {
            switch size {
            case Size.zero: self = LineWidth.zero
            case Size.extraSmall: self = LineWidth.extraSmall
            case Size.small: self = LineWidth.small
            case Size.mediumSmall: self = LineWidth.mediumSmall
            case Size.medium: self = LineWidth.medium
            case Size.mediumLarge: self = LineWidth.mediumLarge
            case Size.large: self = LineWidth.large
            case Size.extraLarge: self = LineWidth.extraLarge
            case Size.title: self = LineWidth.title
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

    public enum CornerRadius: CGFloat, Sizable {
        /** 0  */
        case zero = 0
        /** 1  */
        case extraSmall = 1
        /** 2  */
        case small = 2
        /** 4  */
        case mediumSmall = 4
        /** 6  */
        case medium = 6
        /** 8  */
        case mediumLarge = 8
        /** 10  */
        case large = 10
        /** 12  */
        case extraLarge = 12
        /** 16  */
        case title = 16
        
        public var size: Format.Size {
            switch self {
            case .zero: return .zero
            case .extraSmall: return .extraSmall
            case .small: return .small
            case .mediumSmall: return .mediumSmall
            case .medium: return .medium
            case .mediumLarge: return .mediumLarge
            case .large: return .large
            case .extraLarge: return .extraLarge
            case .title: return .title
            }
        }
        
        public init(_ size: Format.Size) {
            switch size {
            case Size.zero: self = CornerRadius.zero
            case Size.extraSmall: self = CornerRadius.extraSmall
            case Size.small: self = CornerRadius.small
            case Size.mediumSmall: self = CornerRadius.mediumSmall
            case Size.medium: self = CornerRadius.medium
            case Size.mediumLarge: self = CornerRadius.mediumLarge
            case Size.large: self = CornerRadius.large
            case Size.extraLarge: self = CornerRadius.extraLarge
            case Size.title: self = CornerRadius.title
            }
        }
    }
    
    public struct ShadowDescription {
        public let on: Bool
        public let cornerRadius: CGFloat
        public let shadowColor: CGColor
        public let shadowOffset: CGSize
        public let shadowOpacity: Float

        init(
            on: Bool? = nil,
            cornerRadius: CGFloat? = nil,
            shadowColor: UIColor? = nil,
            shadowOffset: CGSize? = nil,
            shadowOpacity: CGFloat? = nil
        ) {
            self.on = on ?? true
            self.cornerRadius = cornerRadius ?? Format.CornerRadius.medium.rawValue
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
    
    public enum UI {
        public enum Height: CGFloat {
            /** 96  */
            case bar = 96
            /** 80  */
            case button = 80
            /** 172  */
            case categoriesCollection = 172
            /** 164  */
            case colorSelect = 164
            /** 108  */
            case graph = 108
            /** 18  */
            case square = 18
        }
        
        public enum Width: CGFloat {
            case categoriesCollection = 192
        }
    }
}
