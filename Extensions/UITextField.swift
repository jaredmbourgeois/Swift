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
    
    public struct UITextFieldSetupModel {
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
            setupModel: UITextField.UITextFieldSetupModel,
            placeholder: String = String.empty,
            placeholderColor: UIColor? = nil,
            textColor: UIColor? = nil,
            text: String = String.empty
        ) {
            self.backgroundColor = setupModel.backgroundColor
            self.cornerRadius = setupModel.cornerRadius
            self.delegate = setupModel.delegate
            self.font = setupModel.font
            self.frame = setupModel.frame
            self.height = setupModel.height
            self.isUserInteractionEnabled = setupModel.isUserInteractionEnabled
            self.placeholder = placeholder
            self.placeholderColor = placeholderColor ?? setupModel.textColor
            self.textAlignment = setupModel.textAlignment
            self.textColor = textColor ?? setupModel.textColor
            self.text = text
        }
    }
    
    convenience init(_ setupModel: UITextField.UITextFieldSetupModel) {
        self.init(frame: setupModel.frame)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = setupModel.frame != CGRect.zero
        backgroundColor = setupModel.backgroundColor
        layer.cornerRadius = setupModel.cornerRadius
        delegate = setupModel.delegate
        isUserInteractionEnabled = setupModel.isUserInteractionEnabled
        font = setupModel.font
        attributedPlaceholder = NSAttributedString(string: setupModel.placeholder, attributes: [NSAttributedString.Key.foregroundColor: setupModel.placeholderColor])
        textAlignment = setupModel.textAlignment
        textColor = setupModel.textColor
        text = setupModel.text
        tintColor = setupModel.textColor
    }
}
