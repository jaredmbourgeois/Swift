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
    
    init(_ string: String? = nil) {
        let string: String = string ?? String.empty
        var matchingFonts: [Font] = Font.allCases.filter({
            string.lowercased().contains($0.rawValue.lowercased())
        })
        self = matchingFonts.first ?? .helveticaNeue
    }
    
    public static func font(_ fontConfig: FontConfig? = nil) -> UIFont {
        let fontConfig: FontConfig = fontConfig ?? FontConfig.common
        switch fontConfig.font {
        case .arial: return arial(size: fontConfig.size, style: fontConfig.style, modifier: fontConfig.modifier)
        case .avenir: return avenir(size: fontConfig.size, style: fontConfig.style, modifier: fontConfig.modifier)
        case .courierNew: return courierNew(size: fontConfig.size, style: fontConfig.style, modifier: fontConfig.modifier)
        case .helveticaNeue: return helveticaNeue(size: fontConfig.size, style: fontConfig.style, modifier: fontConfig.modifier)
        case .trebuchet: return trebuchet(size: fontConfig.size, style: fontConfig.style, modifier: fontConfig.modifier)
        }
    }
    
    private static func arial(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .arial, style: style, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func avenir(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .avenir, style: style, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func courierNew(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .courierNew, style: style, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func helveticaNeue(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .helveticaNeue, style: style, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    private static func trebuchet(size: Format.Size, style: Font.Style, modifier: Font.Modifier) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fontName: String = self.fontName(font: .trebuchet, style: style, modifier: modifier)
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
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
                    Font.helveticaNeue.rawValue + "-" + Font.Style.thin.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Style.thin.rawValue
            case .ultraLight:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Style.ultraLight.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Style.ultraLight.rawValue
            case .light:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Style.light.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Style.light.rawValue
            case .regular:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue
            case .medium:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Style.medium.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Style.medium.rawValue
            case .semiBold, .bold:
                fontName = modifier == Font.Modifier.italic ?
                    Font.helveticaNeue.rawValue + "-" + Font.Style.bold.rawValue + Font.Modifier.italic.rawValue :
                    Font.helveticaNeue.rawValue + "-" + Font.Style.bold.rawValue
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
    public struct FontConfig: Equatable {
        let font: Font
        let size: Format.Size
        let style: Style
        let modifier: Modifier
        
        static let common = FontConfig(font: .helveticaNeue, size: .medium, style: .regular, modifier: .none)
    }
    
    public enum Size: CGFloat, Sizable {
        case zero = 0
        case extraSmall = 10
        case small = 12
        case mediumSmall = 16
        case medium = 20
        case mediumLarge = 24
        case large = 32
        case extraLarge = 36
        case title = 42
        
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
