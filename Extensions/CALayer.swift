//
//  Extensions/CALayer.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

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
