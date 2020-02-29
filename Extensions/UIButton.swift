//
//  Extensions/UIButton.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIButton {
    public static func button(title: String? = nil, font: UIFont? = nil, textAlignment: NSTextAlignment? = nil, textColor: UIColor? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.showsTouchWhenHighlighted = true
        btn.clipsToBounds = false
        btn.contentMode = .scaleToFill

        btn.backgroundColor = backgroundColor ?? UIColor.red
        btn.layer.cornerRadius = cornerRadius ?? 0
        
        btn.setTitle(title ?? "", for: .normal)
        btn.setTitleColor(textColor ?? UIColor.red, for: .normal)
        btn.titleLabel?.backgroundColor = .clear
        btn.titleLabel?.font = font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        btn.titleLabel?.textAlignment = textAlignment ?? NSTextAlignment.left
        btn.titleLabel?.textColor = textColor ?? UIColor.red
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }
}
