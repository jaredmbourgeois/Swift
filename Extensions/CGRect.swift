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
    public var center: CGPoint { CGPoint(x: self.origin.x + 0.5 * self.size.width, y: self.origin.y + 0.5 * self.size.height) }
}