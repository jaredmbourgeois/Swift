//
//  Extensions/UIStackView.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIStackView {
    public func addSpacer() {
        let spacer: UIView = UIView()
        spacer.backgroundColor = .clear
        spacer.clipsToBounds = false
        spacer.isUserInteractionEnabled = false
        spacer.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(spacer)
    }
}
