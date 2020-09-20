//
//  Extensions/UIFont.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIFont {
    public static let system = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    
    public static func font(name: String, size: Format.Size, bold: Bool) -> UIFont {
        let fontSize: CGFloat = Font.Size(size).rawValue
        let fnt = UIFont(name: name, size: CGFloat(fontSize))!
        
        switch bold {
        case true:
            let descriptor: UIFontDescriptor = fnt.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold)!
            return UIFont(descriptor: descriptor, size: CGFloat(size.rawValue))
            
        case false:
            return fnt
        }
    }
}
