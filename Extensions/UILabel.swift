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
    public struct Config {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        let font: UIFont
        let frame: CGRect
        let height: CGFloat
        let numberOfLines: Int
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        let text: String
        
        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = 0,
            font: UIFont = .systemFont(ofSize: UIFont.systemFontSize),
            frame: CGRect = CGRect.zero,
            height: CGFloat = 0,
            numberOfLines: Int = 1,
            textAlignment: NSTextAlignment = .left,
            textColor: UIColor = .black,
            text: String = String.empty
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.font = font
            self.frame = frame
            self.height = height
            self.numberOfLines = numberOfLines
            self.textAlignment = textAlignment
            self.textColor = textColor
            self.text = text
        }
        
        init(config: UILabel.Config, text: String) {
            self.backgroundColor = config.backgroundColor
            self.cornerRadius = config.cornerRadius
            self.font = config.font
            self.frame = config.frame
            self.height = config.height
            self.numberOfLines = config.numberOfLines
            self.textAlignment = config.textAlignment
            self.textColor = config.textColor
            self.text = text
        }
    }
    
    convenience init(_ config: UILabel.Config) {
        self.init(frame: config.frame)
        self.isUserInteractionEnabled = false
        self.configure(config)
    }

    public func configure(_ config: UILabel.Config) {
        self.frame = config.frame
        self.translatesAutoresizingMaskIntoConstraints = self.frame != CGRect.zero
        self.adjustsFontSizeToFitWidth = config.numberOfLines > 0
        self.layer.cornerRadius = config.cornerRadius

        self.backgroundColor = config.backgroundColor
        self.font = config.font
        self.numberOfLines = config.numberOfLines
        self.textAlignment = config.textAlignment
        self.textColor = config.textColor
        self.text = config.text
    }
}
