//
//  Extensions/UIApplication.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIApplication {
    static func statusBarStyleForBackground(color: UIColor) -> UIStatusBarStyle {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        let success: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return success == true ?
            (brightness >= 0.5 ?
                UIStatusBarStyle.darkContent : UIStatusBarStyle.lightContent
            ) :
            UIStatusBarStyle.default
    }
}
