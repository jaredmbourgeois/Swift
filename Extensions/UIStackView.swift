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
    
    public convenience init(frame: CGRect = .zero, axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution) {
        self.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = frame != .zero
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
    }
}
