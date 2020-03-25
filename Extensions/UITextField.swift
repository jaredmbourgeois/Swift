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
            self.leftView = wrapperView
            self.leftViewMode = .always
        }
    }
    
    public struct Config {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
        let font: UIFont
        let frame: CGRect
        let height: CGFloat
        let isUserInteractionEnabled: Bool
        let placeholder: String
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        let text: String

        init(
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = 0,
            font: UIFont,
            frame: CGRect = .zero,
            height: CGFloat = .zero,
            isUserInteractionEnabled: Bool = false,
            placeholder: String = String.empty,
            textAlignment: NSTextAlignment = .left,
            textColor: UIColor,
            text: String = String.empty
        ) {
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
            self.font = font
            self.frame = frame
            self.height = height
            self.isUserInteractionEnabled = isUserInteractionEnabled
            self.placeholder = placeholder
            self.textAlignment = textAlignment
            self.textColor = textColor
            self.text = text
        }
    }
    
    convenience init(_ config: UITextField.Config) {
        self.init(frame: config.frame)
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = config.frame != CGRect.zero
        self.backgroundColor = config.backgroundColor
        self.isUserInteractionEnabled = config.isUserInteractionEnabled
        self.font = config.font
        self.attributedPlaceholder = NSAttributedString(string: config.placeholder, attributes: [NSAttributedString.Key.foregroundColor: config.textColor])
        self.textAlignment = config.textAlignment
        self.textColor = config.textColor
        self.text = config.text
        self.tintColor = config.textColor
    }
}
