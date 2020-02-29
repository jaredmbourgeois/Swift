//
//  Font.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

public enum Font: String, CaseIterable {
    case arial = "Arial"
    case avenir = "Avenir"
    case courierNew = "CourierNewPS"
    case helveticaNeue = "HelveticaNeue"
    case trebuchet = "Trebuchet"
    
    public static func caseFrom(_ string: String? = nil) -> Font {
        let string: String = string ?? String.empty
        var font: Font? = nil
        for thisFont in Font.allCases {
            if string.lowercased().contains(thisFont.rawValue.lowercased()) {
                font = thisFont
            }
        }
        return font ?? .helveticaNeue
    }
    
    public static func font(_ config: Config? = nil) -> UIFont {
        let config: Config = config ?? Config.shared
        switch config.font {
        case .arial: return arial(size: config.size, style: config.style, modifier: config.modifier)
        case .avenir: return avenir(size: config.size, style: config.style, modifier: config.modifier)
        case .courierNew: return courierNew(size: config.size, style: config.style, modifier: config.modifier)
        case .helveticaNeue: return helveticaNeue(size: config.size, style: config.style, modifier: config.modifier)
        case .trebuchet: return trebuchet(size: config.size, style: config.style, modifier: config.modifier)
        }
    }
    
    private static func arial(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
        let name: String = fontName(font: .arial, style: style, modifier: modifier)
        return UIFont(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func avenir(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
        let name: String = fontName(font: .avenir, style: style, modifier: modifier)
        return UIFont(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func courierNew(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
        let name: String = fontName(font: .courierNew, style: style, modifier: modifier)
        return UIFont(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func helveticaNeue(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
        let name: String = fontName(font: .helveticaNeue, style: style, modifier: modifier)
        return UIFont(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func trebuchet(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size.number(from: size).cgFloatValue
        let name: String = fontName(font: .trebuchet, style: style, modifier: modifier)
        return UIFont(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func fontName(font: Font, style: Font.Style, modifier: Font.Modifier) -> String {
        var fontName: String = String.empty
        switch font {
        case .arial:
            switch style {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.arial.rawValue + "-" + Font.Modifier.italic.rawValue + "MT" :
                    Font.arial.rawValue + "MT"
            case .semiBold, .bold:
                fontName = Font.arial.rawValue + "-" + Font.Style.bold.rawValue + modifier.rawValue + "MT"
            }
        case .avenir:
            switch style {
            case .thin, .ultraLight, .light:
                fontName = Font.avenir.rawValue + "-" + Font.Style.light.rawValue
            case .regular:
                fontName = Font.avenir.rawValue + "-" + "Book"
            case .medium:
                fontName = Font.avenir.rawValue + "-" + Font.Style.medium.rawValue
            case .semiBold:
                fontName = Font.avenir.rawValue + "-" + "Heavy"
            case .bold:
                fontName = Font.avenir.rawValue + "-" + "Black"
            }
            fontName = modifier == Font.Modifier.italic ? fontName + "Oblique" : fontName
        case .courierNew:
            switch style {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.courierNew.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.courierNew.rawValue
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    Font.courierNew.rawValue + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.courierNew.rawValue + "-" + Font.Style.bold.rawValue
            }
            fontName = fontName + "MT"
        case .helveticaNeue:
            switch style {
            case .thin:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.thin.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.thin.rawValue
            case .ultraLight:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.ultraLight.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.ultraLight.rawValue
            case .light:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.light.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.light.rawValue
            case .regular:
                if (modifier == Font.Modifier.italic) {
                    fontName = fontName + "-" + Font.Modifier.italic.rawValue
                }
            case .medium:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.medium.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.medium.rawValue
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    fontName + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    fontName + "-" + Font.Style.bold.rawValue
            }
        case .trebuchet:
            switch style {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == .italic ?
                    Font.trebuchet.rawValue + "MS" + "-" + Font.Modifier.italic.rawValue :
                    Font.trebuchet.rawValue + "MS"
            case .semiBold, .bold:
                fontName = modifier == .italic ?
                    Font.trebuchet.rawValue + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.trebuchet.rawValue + "MS" + "-" + Font.Style.bold.rawValue
            }
        }
        return fontName
    }
}

extension Font {
    public struct Config: Equatable {
        let font: Font
        let size: Format.Size
        let style: Style
        let modifier: Modifier
        
        static var shared: Config { Config(font: .helveticaNeue, size: .medium, style: .regular, modifier: .none) }
    }
    
    public enum Size: Int, Sizable {
        case zero = 0
        case extraSmall = 10
        case small = 12
        case mediumSmall = 16
        case medium = 20
        case mediumLarge = 24
        case large = 32
        case extraLarge = 36
        case title = 42
        
        static public func size(from number: NSNumber) -> Format.Size {
            switch number.intValue {
            case Size.zero.rawValue: return Format.Size.zero
            case Size.extraSmall.rawValue: return Format.Size.extraSmall
            case Size.small.rawValue: return Format.Size.small
            case Size.mediumSmall.rawValue: return Format.Size.mediumSmall
            case Size.medium.rawValue: return Format.Size.medium
            case Size.mediumLarge.rawValue: return Format.Size.mediumLarge
            case Size.large.rawValue: return Format.Size.large
            case Size.extraLarge.rawValue: return Format.Size.extraLarge
            case Size.title.rawValue: return Format.Size.title
            default: return Format.Size.zero
            }
        }
        
        static public func number(from size: Format.Size) -> NSNumber {
            switch size {
            case Format.Size.zero: return NSNumber(CGFloat.zero)
            case Format.Size.extraSmall: return NSNumber(Font.Size.extraSmall.rawValue)
            case Format.Size.small: return NSNumber(Font.Size.small.rawValue)
            case Format.Size.mediumSmall: return NSNumber(Font.Size.mediumSmall.rawValue)
            case Format.Size.medium: return NSNumber(Font.Size.medium.rawValue)
            case Format.Size.mediumLarge: return NSNumber(Font.Size.mediumLarge.rawValue)
            case Format.Size.large: return NSNumber(Font.Size.large.rawValue)
            case Format.Size.extraLarge: return NSNumber(Font.Size.extraLarge.rawValue)
            case Format.Size.title: return NSNumber(Font.Size.title.rawValue)
            }
        }
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
}
