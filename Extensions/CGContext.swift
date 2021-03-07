//
//  CGContext.swift
//  streak
//
//  Created by Jared Bourgeois on 2/7/21.
//  Copyright © 2021 jaredmbourgeois. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGContext {
    public func drawCheck(
        in rect: CGRect,
        colorCheck: CGColor,
        colorCircle: CGColor,
        colorOutline: CGColor? = nil,
        lineWidthWeight: CGFloat = CGFloat(1.0/16.0),
        isChecked: Bool = true
    ) {
        let dimension = rect.size.min
        let lineWidthOutline = lineWidthWeight * dimension
        let lineWidthCheck = lineWidthWeight * dimension
        let insetCheck = 2 * lineWidthOutline + 0.5 * lineWidthCheck
        
        let outlineRect = CGRect(
            x: rect.origin.x + 0.5 * lineWidthOutline,
            y: rect.origin.y + 0.5 * lineWidthOutline,
            width: rect.size.width - lineWidthOutline,
            height: rect.size.height - lineWidthOutline
        )
        let checkRect = CGRect(
            x: rect.origin.x + insetCheck,
            y: rect.origin.y + insetCheck,
            width: rect.size.width - 2 * insetCheck,
            height: rect.size.height - 2 * insetCheck
        )
        if isChecked {
            setFillColor(colorCircle)
            fillEllipse(in: rect)
            
            if let colorOutline = colorOutline {
                setStrokeColor(colorOutline)
                setLineWidth(lineWidthOutline)
                strokeEllipse(in: outlineRect)
            }
            
            setStrokeColor(colorCheck)
            setLineCap(.round)
            setLineJoin(.round)
            setLineWidth(lineWidthCheck)
            addPath(CGPath.check(rect: checkRect))
            strokePath()
        } else {
            setStrokeColor(colorCircle)
            setLineWidth(lineWidthOutline)
            strokeEllipse(in: outlineRect)
        }
        
    }
}
