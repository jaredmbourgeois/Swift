//
//  Extensions/UITextField.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UITextField {
    public func addLeftViewImage(named imageName: String) {
        let wrapperView: UIView = UIView(frame: self.leftViewRect(forBounds: bounds))
        wrapperView.clipsToBounds = true
        
        if let image: UIImage = UIImage(named: imageName) {
            let imageView: UIImageView = UIImageView(frame: self.leftViewRect(forBounds: bounds))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            wrapperView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5),
                imageView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5)
            ])
            leftView = wrapperView
            leftViewMode = .always
        }
    }
    
    public struct Config {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        let delegate: UITextFieldDelegate?
        let font: UIFont
        let frame: CGRect
        let height: CGFloat
        let isUserInteractionEnabled: Bool
        let placeholder: String
        let placeholderColor: UIColor
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        let text: String

        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = 0,
            delegate: UITextFieldDelegate? = nil,
            font: UIFont,
            frame: CGRect = .zero,
            height: CGFloat = .zero,
            isUserInteractionEnabled: Bool = false,
            placeholder: String = String.empty,
            placeholderColor: UIColor? = nil,
            textAlignment: NSTextAlignment = .left,
            textColor: UIColor,
            text: String = String.empty
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.delegate = delegate
            self.font = font
            self.frame = frame
            self.height = height
            self.isUserInteractionEnabled = isUserInteractionEnabled
            self.placeholder = placeholder
            self.placeholderColor = placeholderColor ?? textColor
            self.textAlignment = textAlignment
            self.textColor = textColor
            self.text = text
        }
        
        init(
            config: UITextField.Config,
            placeholder: String = String.empty,
            placeholderColor: UIColor? = nil,
            textColor: UIColor? = nil,
            text: String = String.empty
        ) {
            self.backgroundColor = config.backgroundColor
            self.cornerRadius = config.cornerRadius
            self.delegate = config.delegate
            self.font = config.font
            self.frame = config.frame
            self.height = config.height
            self.isUserInteractionEnabled = config.isUserInteractionEnabled
            self.placeholder = placeholder
            self.placeholderColor = placeholderColor ?? config.textColor
            self.textAlignment = config.textAlignment
            self.textColor = textColor ?? config.textColor
            self.text = text
        }
    }
    
    convenience init(_ config: UITextField.Config) {
        self.init(frame: config.frame)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = config.frame != CGRect.zero
        backgroundColor = config.backgroundColor
        layer.cornerRadius = config.cornerRadius
        delegate = config.delegate
        isUserInteractionEnabled = config.isUserInteractionEnabled
        font = config.font
        attributedPlaceholder = NSAttributedString(string: config.placeholder, attributes: [NSAttributedString.Key.foregroundColor: config.placeholderColor])
        textAlignment = config.textAlignment
        textColor = config.textColor
        text = config.text
        tintColor = config.textColor
    }
}
