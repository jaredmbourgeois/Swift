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
        shadow(
            on: description.on,
            cornerRadius: description.cornerRadius,
            color: description.shadowColor,
            offset: description.shadowOffset,
            opacity: description.shadowOpacity,
            path: description.shadowPath,
            radius: description.shadowRadius
        )
    }

    public func shadow(
        on: Bool,
        cornerRadius: CGFloat?,
        color: CGColor,
        offset: CGSize,
        opacity: Float,
        path: CGPath?,
        radius: CGFloat
    ) -> Void {
        if on {
            masksToBounds = false
            self.cornerRadius = cornerRadius ?? self.cornerRadius
            shadowColor = color
            shadowOffset = offset
            shadowOpacity = opacity
            shadowPath = path
            shadowRadius = radius
        } else {
            shadowOff()
        }
    }
    
    public func shadowOff() {
        shadowColor = .clear
        shadowOffset = .zero
        shadowOpacity = .zero
        shadowPath = nil
        shadowRadius = .zero
    }
    
//    public func rotate(
//        angle: CGFloat,
//        rotationPoint: CGPoint? = nil,
//        animationTime: TimeInterval = 0.0
//    ) {
//        let rotationPoint = rotationPoint ?? contentsRect.center
//        let center = contentsRect.center
//        var transform = CATransform3DIdentity
//        transform = CATransform3DTranslate(
//            transform,
//            rotationPoint.x-center.x,
//            rotationPoint.y-center.y,
//            0.0
//        )
//        transform = CATransform3DRotate(
//            transform,
//            angle,
//            0.0,
//            0.0,
//            -1.0
//        )
//        transform = CATransform3DTranslate(
//            transform,
//            center.x - rotationPoint.x,
//            center.y - rotationPoint.y,
//            0.0
//        )
//        
//        print("***** CALayer.rotate(")
//        print("***** \tangle: \(String(format: "%.2f", angle))")
//        print("***** \trotationPoint: \(String(format: "CGPoint(x: \(String(format: "%.0f", rotationPoint.x)), y: \(String(format: "%.0f", rotationPoint.y)))", animationTime)))")
//        print("***** \tanimationTime: \(String(format: "%.2f", animationTime))")
//        print("***** ) {")
//        print("***** \tcurrentTransform = \(self.transform.self)")
//        print("***** \tnewTransform = \(transform.self)")
//        print("***** }")
//
//
//        if animationTime > 0 {
//            UIView.animate(withDuration: animationTime) { self.transform = transform }
//        } else {
//            self.transform = transform
//        }
//    }
}
