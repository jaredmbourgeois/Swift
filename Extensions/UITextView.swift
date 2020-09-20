//
//  UITextView.swift
//  streak
//
//  Created by  Jared on 3/22/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import UIKit

extension UITextView {
    convenience init(_ setupModel: UITextViewSetupModel) {
        self.init(frame: setupModel.frame)
        self.translatesAutoresizingMaskIntoConstraints = setupModel.frame != CGRect.zero
        self.backgroundColor = setupModel.backgroundColor
        self.layer.cornerRadius = setupModel.cornerRadius
        self.font = setupModel.font
        self.isEditable = setupModel.isEditable
        self.isScrollEnabled = setupModel.isScrollEnabled
        self.isUserInteractionEnabled = setupModel.isUserInteractionEnabled
        self.textAlignment = setupModel.textAlignment
        self.textColor = setupModel.textColor
        self.text = setupModel.text
        self.tintColor = setupModel.textColor
    }
}
