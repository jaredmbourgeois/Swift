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
            imageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5).isActive = true
            imageView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5).isActive = true
            self.leftView = wrapperView
            self.leftViewMode = .always
        }
    }

    public static func textField() -> UITextField { UITextField.textField(font: nil, textColor: nil, textAlignment: nil, numberOfLines: nil) }
    
    public static func textField(font: UIFont?, textColor: UIColor?, textAlignment: NSTextAlignment?, numberOfLines: Int?) -> UITextField {
        let txtField: UITextField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .clear
        txtField.isUserInteractionEnabled = false
        txtField.font = font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        txtField.textColor = textColor ?? .red
        txtField.textAlignment = textAlignment ?? .left
        txtField.tintColor = textColor ?? .red
        txtField.adjustsFontSizeToFitWidth = true
        return txtField
    }
}