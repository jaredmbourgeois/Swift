//
//  Extensions/UIScrollView.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIScrollView {
    public static func indicatorStyle(matching: Bool, color: UIColor) -> UIScrollView.IndicatorStyle {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return success == true ?
        (brightness >= 0.5 ?
            (matching == true ? .white : .black) :
            (matching == true ? .black : .white)
        ) :
        .default
    }
}