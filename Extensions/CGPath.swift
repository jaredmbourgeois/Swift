//
//  Extensions/CGPath.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension CGPath {
    
    public enum Corner {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    public static func rounded(
        rect: CGRect,
        cornerRadius: CGFloat,
        lineWidth: CGFloat,
        corner: CGPath.Corner
    ) -> CGPath {
        let mutablePath: CGMutablePath = CGMutablePath()
        let margin: CGFloat = 0.5*lineWidth
        let topLeft: CGPoint = CGPoint(x: rect.minX + margin, y: rect.minY + margin)
        let topRight: CGPoint = CGPoint(x: rect.maxX - margin, y: rect.minY + margin)
        let bottomLeft: CGPoint = CGPoint(x: rect.minX + margin, y: rect.maxY - margin)
        let bottomRight: CGPoint = CGPoint(x: rect.maxX - margin, y: rect.maxY - margin)
        let radius: CGFloat
        
        switch corner {
        case .topLeft:
            radius = cornerRadius
            mutablePath.move(to: bottomLeft)
            mutablePath.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + radius))
            mutablePath.addRelativeArc(center: CGPoint(x: topLeft.x + radius, y: topLeft.y + radius), radius: radius, startAngle: .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: topRight)
            mutablePath.addLine(to: bottomRight)
            mutablePath.addLine(to: bottomLeft)
            break
            
        case .topRight:
            radius = cornerRadius
            mutablePath.move(to: bottomLeft)
            mutablePath.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + radius))
            mutablePath.addLine(to: topLeft)
            mutablePath.addRelativeArc(center: CGPoint(x: topRight.x - radius, y: topRight.y + radius), radius: radius, startAngle: (3.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: bottomRight)
            mutablePath.addLine(to: bottomLeft)
            break
            
        case .bottomLeft:
            radius = cornerRadius
            mutablePath.move(to: topLeft)
            mutablePath.addLine(to: topRight)
            mutablePath.addLine(to: bottomRight)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomLeft.x + radius, y: bottomLeft.y - radius), radius: radius, startAngle: (1.0/2.0) * .pi, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: topLeft)
            break
            
        case .bottomRight:
            radius = cornerRadius
            mutablePath.move(to: topLeft)
            mutablePath.addLine(to: topRight)
            mutablePath.addRelativeArc(center: CGPoint(x: bottomRight.x - radius, y: bottomRight.y - radius), radius: radius, startAngle: 0, delta: (1.0/2.0) * .pi)
            mutablePath.addLine(to: bottomLeft)
            mutablePath.addLine(to: topLeft)
            break
        }
        return mutablePath.copy()!
    }
    
    public static func rounded(
        rect: CGRect,
        cornerRadius: CGFloat,
        lineWidth: CGFloat,
        position: Format.Position = .isolated
    ) -> CGPath {
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
    
    public static func check(rect: CGRect) -> CGPath {
        let x: (left: CGFloat, middle: CGFloat, right: CGFloat) = (left: (4.5/32.0), middle: (12.5/32.0), right: (26.0/32.0))
        let y: (top: CGFloat, middle: CGFloat, bottom: CGFloat) = (top: (7.0/32.0), middle: (15.5/32.0), bottom: (23.0/32.0))

        let mutablePath: CGMutablePath = CGMutablePath()
        mutablePath.move(to: CGPoint(x: rect.origin.x + x.left * rect.size.width, y: rect.origin.y + y.middle * rect.size.height))
        mutablePath.addLine(to: CGPoint(x: rect.origin.x + x.middle * rect.size.width, y: rect.origin.y + y.bottom * rect.size.height))
        mutablePath.addLine(to: CGPoint(x: rect.origin.x + x.right * rect.size.width, y: rect.origin.y + y.top * rect.size.height))
        return mutablePath.copy()!
    }    
}
