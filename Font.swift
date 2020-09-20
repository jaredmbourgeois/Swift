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
    case menlo = "Menlo"
    case pingFang = "PingFangTC"
    case system
    case trebuchet = "Trebuchet"
    case verdana = "Verdana"
    
    init(_ string: String? = nil) {
        let string: String = string ?? String.empty
        let matchingFonts: [Font] = Font.allCases.filter({
            string.lowercased().contains($0.rawValue.lowercased())
        })
        self = matchingFonts.first ?? .helveticaNeue
    }
    
    public static func font(_ fontConfig: FontConfig? = nil) -> UIFont {
        let fontConfig: FontConfig = fontConfig ?? FontConfig.common
        switch fontConfig.font {
        case .arial: return arial(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .avenir: return avenir(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .courierNew: return courierNew(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .helveticaNeue: return helveticaNeue(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .menlo: return menlo(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .pingFang: return pingFang(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .system: return system(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .trebuchet: return trebuchet(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        case .verdana: return verdana(size: fontConfig.size, weight: fontConfig.weight, modifier: fontConfig.modifier)
        }
    }
    
    private static func arial(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .arial, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func avenir(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .avenir, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func courierNew(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .courierNew, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func helveticaNeue(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .helveticaNeue, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func menlo(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .menlo, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func pingFang(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .pingFang, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func system(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        return UIFont.systemFont(ofSize: fontSize, weight: weight.uiFontWeight())
    }
    
    private static func trebuchet(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .trebuchet, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func verdana(size: Format.Size, weight: Font.Weight, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .verdana, weight: weight, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func fontName(font: Font, weight: Font.Weight, modifier: Font.Modifier) -> String {
        var fontName: String = String.empty
        switch font {
        case .arial:
            switch weight {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.arial.rawValue + "-" + Font.Modifier.italic.rawValue + "MT" :
                    Font.arial.rawValue + "MT"
            case .semiBold, .bold:
                fontName = Font.arial.rawValue + "-" + Font.Weight.bold.rawValue + modifier.rawValue + "MT"
            }
        case .avenir:
            switch weight {
            case .thin, .ultraLight, .light:
                fontName = Font.avenir.rawValue + "-" + Font.Weight.light.rawValue
            case .regular:
                fontName = Font.avenir.rawValue + "-" + "Book"
            case .medium:
                fontName = Font.avenir.rawValue + "-" + Font.Weight.medium.rawValue
            case .semiBold:
                fontName = Font.avenir.rawValue + "-" + "Heavy"
            case .bold:
                fontName = Font.avenir.rawValue + "-" + "Black"
            }
            fontName = modifier == Font.Modifier.italic ? fontName + "Oblique" : fontName
        case .courierNew:
            switch weight {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.courierNew.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.courierNew.rawValue
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    Font.courierNew.rawValue + "-" + Font.Weight.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.courierNew.rawValue + "-" + Font.Weight.bold.rawValue
            }
            fontName = fontName + "MT"
        case .helveticaNeue:
            switch weight {
            case .thin:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.thin.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.thin.rawValue
            case .ultraLight:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.ultraLight.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.ultraLight.rawValue
            case .light:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.light.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.light.rawValue
            case .regular:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue
            case .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.medium.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.medium.rawValue
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Weight.bold.rawValue
            }
        case .menlo:
            switch weight {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == .italic ?
                    Font.menlo.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.menlo.rawValue + "-Regular"
            case .semiBold, .bold:
                fontName = modifier == .italic ?
                    Font.menlo.rawValue + "-" + Font.Weight.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.menlo.rawValue + "-" + Font.Weight.bold.rawValue
            }
        case .pingFang:
            switch weight {
            case .thin:
                fontName = modifier == Font.Modifier.italic ?
                    Font.pingFang.rawValue + "-" + Font.Weight.thin.rawValue + Font.Modifier.italic.rawValue :
                    Font.pingFang.rawValue + "-" + Font.Weight.thin.rawValue
            case .ultraLight:
                fontName = modifier == Font.Modifier.italic ?
                    Font.pingFang.rawValue + "-" + Font.Weight.ultraLight.rawValue + Font.Modifier.italic.rawValue :
                    Font.pingFang.rawValue + "-" + Font.Weight.ultraLight.rawValue
            case .light:
                fontName = modifier == Font.Modifier.italic ?
                    Font.pingFang.rawValue + "-" + Font.Weight.light.rawValue + Font.Modifier.italic.rawValue :
                    Font.pingFang.rawValue + "-" + Font.Weight.light.rawValue
            case .regular:
                fontName = modifier == Font.Modifier.italic ?
                    Font.pingFang.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.pingFang.rawValue
            case .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.pingFang.rawValue + "-" + Font.Weight.medium.rawValue + Font.Modifier.italic.rawValue :
                    Font.pingFang.rawValue + "-" + Font.Weight.medium.rawValue
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    Font.pingFang.rawValue + "-" + Font.Weight.semiBold.rawValue + Font.Modifier.italic.rawValue :
                    Font.pingFang.rawValue + "-" + Font.Weight.semiBold.rawValue
            }
        case .system:
            return String.empty
        case .trebuchet:
            switch weight {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == .italic ?
                    Font.trebuchet.rawValue + "MS" + "-" + Font.Modifier.italic.rawValue :
                    Font.trebuchet.rawValue + "MS"
            case .semiBold, .bold:
                fontName = modifier == .italic ?
                    Font.trebuchet.rawValue + "-" + Font.Weight.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.trebuchet.rawValue + "MS" + "-" + Font.Weight.bold.rawValue
            }
        case .verdana:
            switch weight {
            case .thin, .ultraLight, .light, .regular, .medium:
                fontName = modifier == .italic ?
                    Font.verdana.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.verdana.rawValue + "-Regular"
            case .semiBold, .bold:
                fontName = modifier == .italic ?
                    Font.verdana.rawValue + "-" + Font.Weight.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.verdana.rawValue + "-" + Font.Weight.bold.rawValue
            }
        }
        return fontName
    }
}

extension Font {
    public struct FontConfig: Hashable {
        let font: Font
        let size: Format.Size
        let weight: Weight
        let modifier: Modifier
        
        static let common = FontConfig(font: .system, size: .medium, weight: .regular, modifier: .none)
    }
    
    public enum Size: CGFloat, Sizable {
        /** 0 */
        case zero = 0
        /** 12 */
        case extraSmall = 12
        /** 16 */
        case small = 16
        /** 20 */
        case mediumSmall = 20
        /** 24 */
        case medium = 24
        /** 28 */
        case mediumLarge = 28
        /** 32 */
        case large = 32
        /** 40 */
        case extraLarge = 40
        /** 48 */
        case title = 48
        
        public init(_ size: Format.Size) {
            switch size {
            case Format.Size.zero: self = Font.Size.zero
            case Format.Size.extraSmall: self = Font.Size.extraSmall
            case Format.Size.small: self = Font.Size.small
            case Format.Size.mediumSmall: self = Font.Size.mediumSmall
            case Format.Size.medium: self = Font.Size.medium
            case Format.Size.mediumLarge: self = Font.Size.mediumLarge
            case Format.Size.large: self = Font.Size.large
            case Format.Size.extraLarge: self = Font.Size.extraLarge
            case Format.Size.title: self = Font.Size.title
            }
        }
        
        public var size: Format.Size {
            switch self {
            case .zero: return Format.Size.zero
            case .extraSmall: return Format.Size.extraSmall
            case .small: return Format.Size.small
            case .mediumSmall: return Format.Size.mediumSmall
            case .medium: return Format.Size.medium
            case .mediumLarge: return Format.Size.mediumLarge
            case .large: return Format.Size.large
            case .extraLarge: return Format.Size.extraLarge
            case .title: return Format.Size.title
            }
        }
    }
    
    public enum Weight: String {
        case thin = "Thin"
        case ultraLight = "UltraLight"
        case light = "Light"
        case regular = "Regular"
        case medium = "Medium"
        case semiBold = "SemiBold"
        case bold = "Bold"
        
        func uiFontWeight() -> UIFont.Weight {
            switch self {
            case .thin: return .thin
            case .ultraLight: return .ultraLight
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .semiBold: return .semibold
            case .bold: return .bold
            }
        }
    }
    
    public enum Modifier: String {
        case none = ""
        case italic = "Italic"
    }
}
