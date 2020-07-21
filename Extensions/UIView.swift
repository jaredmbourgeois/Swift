//
//  Extensions/UIView.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UIView {
    
    public func constraintsForSuperView(insetX: CGFloat = 0, insetY: CGFloat = 0) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return [
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insetY),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insetY),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insetX),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insetX),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insetX),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insetX),
            widthAnchor.constraint(equalTo: superview.widthAnchor, constant: -2 * insetX),
            heightAnchor.constraint(equalTo: superview.heightAnchor, constant: -2 * insetY)
        ]
    }
    
    public func constrainToSuperview(insetX: CGFloat = 0, insetY: CGFloat = 0) -> Void {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintsForSuperView(insetX: insetX, insetY: insetY))
    }
    
    public func destroySubviews() -> Void {
        let oldSubviews = self.subviews
        var subview: UIView?
        for index: Int in 0 ..< oldSubviews.count {
            subview = oldSubviews[index]
            subview?.removeFromSuperview()
            subview = nil
        }
    }
    
    public func removeSubviews() -> Void {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
}
