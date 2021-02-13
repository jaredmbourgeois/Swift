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
    
    public convenience init(_ setupModel: UITextFieldSetupModel) {
        self.init(frame: setupModel.frame)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = setupModel.frame != CGRect.zero
        setup(setupModel)
    }
    
    public func setup(_ setupModel: UITextFieldSetupModel) {
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
    
    public func updateText(
        text: String? = nil,
        textColor: UIColor? = nil,
        placeholder: String? = nil,
        placeholderColor: UIColor? = nil
    ) {
        let newText = text ?? self.text ?? .empty
        let newTextColor = textColor ?? self.textColor ?? .black
        let newPlaceholder = placeholder ?? attributedPlaceholder?.string ?? .empty
        let newPlaceholderColor = placeholderColor ?? newTextColor
        self.text = newText
        self.textColor = newTextColor
        self.tintColor = newTextColor
        self.attributedPlaceholder = NSAttributedString(
            string: newPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: newPlaceholderColor]
        )
    }
}
