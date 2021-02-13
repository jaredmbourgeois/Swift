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
    
    public convenience init(_ setupModel: UIButtonSetupModel) {
        self.init(frame: setupModel.frame)
        isUserInteractionEnabled = true
        contentMode = .scaleToFill
        setup(setupModel)
    }
    
    func setup(_ setupModel:  UIButtonSetupModel) {
        frame = setupModel.frame
        backgroundColor = setupModel.backgroundColor
        clipsToBounds = setupModel.cornerRadius > 0
        layer.cornerRadius = setupModel.cornerRadius
        showsTouchWhenHighlighted = setupModel.showsTouchWhenHighlighted
        translatesAutoresizingMaskIntoConstraints = setupModel.frame != CGRect.zero

        setupTitleLabel(setupModel.labelSetupModel)
        if let target = setupModel.target, let selector = setupModel.selector {
            addTarget(target, action: selector, for: setupModel.controlEvent)
        }
    }
    
    func setupTitleLabel(_ labelSetupModel: UILabelSetupModel) {
        setTitle(labelSetupModel.text, for: .normal)
        setTitleColor(labelSetupModel.textColor, for: .normal)
        titleLabel?.adjustsFontSizeToFitWidth = labelSetupModel.numberOfLines > 0
        titleLabel?.backgroundColor = labelSetupModel.backgroundColor
        titleLabel?.font = labelSetupModel.font
        titleLabel?.numberOfLines = labelSetupModel.numberOfLines
        titleLabel?.textAlignment = labelSetupModel.textAlignment
        titleLabel?.textColor = labelSetupModel.textColor
    }
}
