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
    public var aspectRatio: CGFloat { CGFloat( self.width / self.height ) }
    public var slope: CGFloat { CGFloat( self.height / self.width ) }
    public func scaleHeight(by width: CGFloat) -> CGFloat { self.height *  width / self.width }
    public func scaleWidth(by height: CGFloat) -> CGFloat { self.width * height / self.height }
}
