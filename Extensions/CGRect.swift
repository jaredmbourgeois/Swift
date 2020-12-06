//
//  Extensions/CGRect.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension CGRect {
    public var center: CGPoint { CGPoint(x: centerX, y: centerY) }
    public var centerX: CGFloat { origin.x + 0.5 * size.width }
    public var centerY: CGFloat { origin.y + 0.5 * size.height }
    public var centerXMaxY: CGPoint { CGPoint(x: centerX, y: maxY) }
    public var centerXOriginY: CGPoint { CGPoint(x: centerX, y: origin.y) }
    public var centerYMaxX: CGPoint { CGPoint(x: maxX, y: centerY) }
    public var centerYOriginX: CGPoint { CGPoint(x: origin.x, y: centerY) }
    public var max: CGPoint { CGPoint(x: maxX, y: maxY) }
    public var maxXOriginY: CGPoint { CGPoint(x: maxX, y: origin.y) }
    public var maxYOriginX: CGPoint { CGPoint(x: origin.x, y: maxY) }
    
    public func intersects(_ rects: [CGRect]) -> Bool {
        var intersects = false
        rects.forEach { rect in
            if self.intersects(rect) {
                intersects = true
            }
        }
        return intersects
    }
    
    public func intersectsVerticalLine(at x: CGFloat) -> Bool {
        origin.x ... (origin.x + size.width) ~= x
    }
    public func intersectsHorizontalLine(at y: CGFloat) -> Bool {
        origin.y ... (origin.y + size.height) ~= y
    }
}
