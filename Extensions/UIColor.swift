//
//  Extensions/UIColor.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIColor {
    public enum Components {
        public struct HSBA: Hashable {
            let hue: CGFloat
            let saturation: CGFloat
            let brightness: CGFloat
            let alpha: CGFloat
            
            init(hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0) {
                self.hue = hue
                self.saturation = saturation
                self.brightness = brightness
                self.alpha = alpha
            }
        }
    }
    
    convenience init(_ componentsHSBA: UIColor.Components.HSBA) {
        self.init(hue: componentsHSBA.hue, saturation: componentsHSBA.saturation, brightness: componentsHSBA.brightness, alpha: componentsHSBA.alpha)
    }
    
    public func componentsHSBA() -> Components.HSBA {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let _: Bool = getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return Components.HSBA(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    public func contrastingComponents(degree: Format.Degree) -> UIColor.Components.HSBA {
        let components = componentsHSBA()
        let contrastHue: CGFloat = components.hue
        let contrastSaturation: CGFloat = components.saturation
        var contrastBrightness: CGFloat = components.brightness
        
        let fraction: CGFloat = degree.rawValue
        if (components.brightness >= 0.5) {
            contrastBrightness -= 0.5 * fraction * components.brightness
        }
        else if (components.brightness < 0.5){
            contrastBrightness += 0.5 * fraction * components.brightness
        }
        return UIColor.Components.HSBA(hue: contrastHue, saturation: contrastSaturation, brightness: contrastBrightness, alpha: components.alpha)
    }
    
    public func desaturated(degree: Format.Degree) -> UIColor { UIColor.desaturated(color: self, degree: degree) }
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
}
