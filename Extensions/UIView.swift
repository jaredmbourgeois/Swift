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
    public func constrainToSuperview() -> Void {
        constrainToSuperview(insetX: 0, insetY: 0)
    }
    
    public func constrainToSuperview(insetX: CGFloat?, insetY: CGFloat?) -> Void {
        if let superView: UIView = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superView.topAnchor, constant: insetY ?? 0),
                bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -(insetY ?? 0)),
                leftAnchor.constraint(equalTo: superView.leftAnchor, constant: insetX ?? 0),
                leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: insetX ?? 0),
                rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -(insetX ?? 0)),
                trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -(insetX ?? 0)),
                widthAnchor.constraint(equalTo: superView.widthAnchor, constant: -2 * (insetX ?? 0)),
                heightAnchor.constraint(equalTo: superView.heightAnchor, constant: -2 * (insetY ?? 0))
            ])
        }
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
