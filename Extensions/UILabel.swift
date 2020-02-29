//
//  Extensions/UILabel.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UILabel {
    public static func label(font: UIFont? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment? = nil, numberOfLines: Int? = nil) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .clear
        lbl.isUserInteractionEnabled = false
        lbl.font = font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        lbl.textColor = textColor ?? .red
        lbl.textAlignment = textAlignment ?? .left
        lbl.numberOfLines = numberOfLines ?? 0
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }
}