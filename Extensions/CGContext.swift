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
        colorOutline: CGColor? = nil
    ) {
        setFillColor(colorCircle)
        fillEllipse(in: rect)
        
        let lineWidthOutline = (1.0/16.0) * rect.size.min
        let lineWidthCheck = (1.0/16.0) * rect.size.min
        let insetCheck = 2 * lineWidthOutline + 0.5 * lineWidthCheck
        
        if let colorOutline = colorOutline {
            setStrokeColor(colorOutline)
            setLineWidth(lineWidthOutline)
            strokeEllipse(in: CGRect(
                x: rect.origin.x + 0.5 * lineWidthOutline,
                y: rect.origin.y + 0.5 * lineWidthOutline,
                width: rect.size.width - lineWidthOutline,
                height: rect.size.height - lineWidthOutline
            ))
        }
        
        setStrokeColor(colorCheck)
        setLineCap(.round)
        setLineJoin(.round)
        addPath(CGPath.check(rect: CGRect(
            x: rect.origin.x + insetCheck,
            y: rect.origin.y + insetCheck,
            width: rect.size.width - 2 * insetCheck,
            height: rect.size.height - 2 * insetCheck
        )))
        strokePath()
    }
}
