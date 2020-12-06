//
//  Extensions/CGSize.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension CGSize {
    public var max: CGFloat { CGFloat.maximum(width, height) }
    public var min: CGFloat { CGFloat.minimum(width, height) }
    public var aspectRatio: CGFloat { CGFloat(width / height) }
    public var slope: CGFloat { CGFloat(height / width) }
    public func scaleHeight(by width: CGFloat) -> CGFloat { height *  width / self.width }
    public func scaleWidth(by height: CGFloat) -> CGFloat { width * height / self.height }
}
