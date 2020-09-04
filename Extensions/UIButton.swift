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
        let target: Any?
        let selector: Selector?
        let controlEvent: UIControl.Event
        
        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = CGFloat.zero,
            frame: CGRect = CGRect.zero,
            height: CGFloat = CGFloat.zero,
            showsTouchWhenHighlighted: Bool = true,
            labelConfig: UILabel.Config = UILabel.Config(),
            target: Any? = nil,
            selector: Selector? = nil,
            controlEvent: UIControl.Event = .touchUpInside
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.frame = frame
            self.height = height
            self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
            self.labelConfig = labelConfig
            self.target = target
            self.selector = selector
            self.controlEvent = controlEvent
        }
        
        init(
            config: UIButton.Config,
            backgroundColor: UIColor? = nil,
            cornerRadius: CGFloat? = nil,
            frame: CGRect? = nil,
            height: CGFloat? = nil,
            showsTouchWhenHighlighted: Bool? = nil,
            labelConfig: UILabel.Config? = nil,
            target: Any? = nil,
            selector: Selector? = nil,
            controlEvent: UIControl.Event? = nil
        ) {
            self.backgroundColor = backgroundColor ?? config.backgroundColor
            self.cornerRadius = cornerRadius ?? config.cornerRadius
            self.frame = frame ?? config.frame
            self.height = height ?? config.height
            self.showsTouchWhenHighlighted = showsTouchWhenHighlighted ?? config.showsTouchWhenHighlighted
            self.labelConfig = labelConfig ?? config.labelConfig
            self.target = target ?? config.target
            self.selector = selector ?? config.selector
            self.controlEvent = controlEvent ?? config.controlEvent
        }
        
        init(
            config: UIButton.Config,
            target: Any? = nil,
            selector: Selector? = nil,
            controlEvent: UIControl.Event = .touchUpInside
        ) {
            self.backgroundColor = config.backgroundColor
            self.cornerRadius = config.cornerRadius
            self.frame = config.frame
            self.height = config.height
            self.showsTouchWhenHighlighted = config.showsTouchWhenHighlighted
            self.labelConfig = config.labelConfig
            self.target = target
            self.selector = selector
            self.controlEvent = controlEvent
        }
    }
    
    convenience init(_ config: UIButton.Config) {
        self.init(frame: config.frame)
        isUserInteractionEnabled = true
        contentMode = .scaleToFill
        configure(config)
    }
    
    public func configure(_ config:  UIButton.Config) {
        frame = config.frame
        backgroundColor = config.backgroundColor
        clipsToBounds = config.cornerRadius > 0
        layer.cornerRadius = config.cornerRadius
        showsTouchWhenHighlighted = config.showsTouchWhenHighlighted
        translatesAutoresizingMaskIntoConstraints = config.frame != CGRect.zero

        configureTitleLabel(config.labelConfig)
        if let target = config.target, let selector = config.selector {
            addTarget(target, action: selector, for: config.controlEvent)
        }
    }
    
    func configureTitleLabel(_ labelConfig: UILabel.Config) {
        titleLabel?.configure(labelConfig)
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
