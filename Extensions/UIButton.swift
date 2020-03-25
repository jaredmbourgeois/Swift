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
    public struct Config {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        let frame: CGRect
        let height: CGFloat
        let showsTouchWhenHighlighted: Bool
        let labelConfig: UILabel.Config
        
        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = CGFloat.zero,
            frame: CGRect = CGRect.zero,
            height: CGFloat = CGFloat.zero,
            showsTouchWhenHighlighted: Bool = true,
            labelConfig: UILabel.Config = UILabel.Config()
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.frame = frame
            self.height = height
            self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
            self.labelConfig = labelConfig
        }
        
        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = CGFloat.zero,
            frame: CGRect = CGRect.zero,
            height: CGFloat = CGFloat.zero,
            showsTouchWhenHighlighted: Bool = true,
            font: UIFont,
            textColor: UIColor,
            text: String
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.frame = frame
            self.height = height
            self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
            self.labelConfig = UILabel.Config(
                font: font,
                textAlignment: .center,
                textColor: textColor,
                text: text
            )
        }
    }
    
    convenience init(_ config: UIButton.Config) {
        self.init(frame: config.frame)
        self.contentMode = .scaleToFill
        self.update(config)
    }
    
    public func update(_ config:  UIButton.Config) {
        self.frame = config.frame
        self.backgroundColor = config.backgroundColor
        self.clipsToBounds = config.cornerRadius > 0
        self.layer.cornerRadius = config.cornerRadius
        self.showsTouchWhenHighlighted = config.showsTouchWhenHighlighted
        self.translatesAutoresizingMaskIntoConstraints = config.frame != CGRect.zero
        
        self.configureTitleLabel(config.labelConfig)
    }
    
    func configureTitleLabel(_ labelConfig: UILabel.Config) {
        setTitle(labelConfig.text, for: .normal)
        setTitleColor(labelConfig.textColor, for: .normal)
        titleLabel?.adjustsFontSizeToFitWidth = labelConfig.numberOfLines > 0
        titleLabel?.backgroundColor = labelConfig.backgroundColor
        titleLabel?.font = labelConfig.font
        titleLabel?.numberOfLines = labelConfig.numberOfLines
        titleLabel?.textAlignment = labelConfig.textAlignment
        titleLabel?.textColor = labelConfig.textColor
    }
}
