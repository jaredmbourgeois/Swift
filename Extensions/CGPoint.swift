//
//  CGPoint.swift
//
//  Created by Jared Bourgeois on 12/12/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//


import CoreGraphics

extension CGPoint {
    var max: CGFloat { CGFloat.maximum(x, y) }
    var min: CGFloat { CGFloat.minimum(x, y) }
}
