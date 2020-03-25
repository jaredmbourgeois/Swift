//
//  UITextView.swift
//  streak
//
//  Created by  Jared on 3/22/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import UIKit

extension UITextView {
    public struct Config {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        let font: UIFont
        let frame: CGRect
        let height: CGFloat
        let isEditable: Bool
        let isScrollEnabled: Bool
        let isUserInteractionEnabled: Bool
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        let text: String

        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = 0,
            font: UIFont,
            frame: CGRect = .zero,
            height: CGFloat = .zero,
            isEditable: Bool = false,
            isScrollEnabled: Bool = false,
            isUserInteractionEnabled: Bool = false,
            textAlignment: NSTextAlignment = .left,
            textColor: UIColor,
            text: String = String.empty
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.font = font
            self.frame = frame
            self.height = height
            self.isEditable = isEditable
            self.isScrollEnabled = isScrollEnabled
            self.isUserInteractionEnabled = isUserInteractionEnabled
            self.textAlignment = textAlignment
            self.textColor = textColor
            self.text = text
        }
    }
    
    convenience init(_ config: UITextView.Config) {
        self.init(frame: config.frame)
        self.translatesAutoresizingMaskIntoConstraints = config.frame != CGRect.zero
        self.backgroundColor = config.backgroundColor
        self.layer.cornerRadius = config.cornerRadius
        self.font = config.font
        self.isEditable = config.isEditable
        self.isScrollEnabled = config.isScrollEnabled
        self.isUserInteractionEnabled = config.isUserInteractionEnabled
        self.textAlignment = config.textAlignment
        self.textColor = config.textColor
        self.text = config.text
        self.tintColor = config.textColor
    }
}
