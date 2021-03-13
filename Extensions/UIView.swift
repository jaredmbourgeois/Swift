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
    
    public func animateSubviewsConstraintRequest(
        _ subviews: [UIView],
        animationTime: TimeInterval,
        constraintRequest: NSLayoutConstraint.ActivationRequest?,
        concurrentAnimations: (() -> Void)? = nil,
        completionHandler: (() -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: animationTime,
            delay: 0,
            options: .layoutSubviews,
            animations: { [weak self] in
                
                constraintRequest?.fulfill()
                
                concurrentAnimations?()
                
                subviews.forEach {
                    $0.layoutIfNeeded()
                    $0.setNeedsDisplay()
                }

                self?.layoutIfNeeded()
                self?.setNeedsDisplay()
            },
            completion: nil
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + animationTime + 0.001, execute: { completionHandler?() })
    }
    
    public func animateConstraintRequest(
        _ view: UIView?,
        animationTime: TimeInterval,
        constraintRequest: NSLayoutConstraint.ActivationRequest?,
        concurrentAnimations: (() -> Void)? = nil,
        completionHandler: (() -> Void)? = nil
    ) {
        let views: [UIView] = {
            guard let view = view else { return [] }
            return [ view ]
        }()
        self.animateSubviewsConstraintRequest(views, animationTime: animationTime, constraintRequest: constraintRequest, concurrentAnimations: concurrentAnimations, completionHandler: completionHandler)
    }
    
    func constraintsForSuperView(insetX: CGFloat = 0, insetY: CGFloat = 0) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return [
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insetY),
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insetX),
            widthAnchor.constraint(equalTo: superview.widthAnchor, constant: -2 * insetX),
            heightAnchor.constraint(equalTo: superview.heightAnchor, constant: -2 * insetY)
        ]
    }
    
    func constrainToSuperview(insetX: CGFloat = 0, insetY: CGFloat = 0) -> Void {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintsForSuperView(insetX: insetX, insetY: insetY))
    }
    
    func destroySubviews() -> Void {
        let oldSubviews = self.subviews
        var subview: UIView?
        for index: Int in 0 ..< oldSubviews.count {
            subview = oldSubviews[index]
            subview?.removeFromSuperview()
            subview = nil
        }
    }
    
    func isActive() -> Bool {
        !isHidden && alpha > 0 && isUserInteractionEnabled
    }
    
    func setActive(
        _ active: Bool = true,
        alphaActive: CGFloat = 1,
        alphaInactive: CGFloat = 0
    ) {
        alpha = active ? alphaActive : alphaInactive
        isUserInteractionEnabled = active
    }
    
    func removeSubviews() -> Void {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func showSubview(
        _ view: UIView,
        animationTime: TimeInterval,
        constraintRequest: NSLayoutConstraint.ActivationRequest?,
        hide: Bool = false,
        concurrentAnimations: (() -> Void)? = nil,
        completionHandler: (() -> Void)? = nil
    ) {
        animateConstraintRequest(
            view,
            animationTime: animationTime,
            constraintRequest: constraintRequest,
            concurrentAnimations: {
                view.isUserInteractionEnabled = !hide
                view.alpha = hide ? 0 : 1
                
                concurrentAnimations?()
            },
            completionHandler: completionHandler
        )
    }
}
