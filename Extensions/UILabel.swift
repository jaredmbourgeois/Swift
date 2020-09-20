//
//  Extensions/UILabel.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UILabel {
    
    convenience init(_ setupModel: UILabelSetupModel) {
        self.init(frame: setupModel.frame)
        self.isUserInteractionEnabled = false
        self.setup(setupModel)
    }

    func setup(_ setupModel: UILabelSetupModel) {
        self.frame = setupModel.frame
        self.translatesAutoresizingMaskIntoConstraints = self.frame != CGRect.zero
        self.adjustsFontSizeToFitWidth = setupModel.numberOfLines > 0
        self.layer.cornerRadius = setupModel.cornerRadius

        self.backgroundColor = setupModel.backgroundColor
        self.font = setupModel.font
        self.numberOfLines = setupModel.numberOfLines
        self.textAlignment = setupModel.textAlignment
        self.textColor = setupModel.textColor
        self.text = setupModel.text
    }
    
    func sizeToFitWidth(preserveCenter: Bool = false) {
        let oldFrame = frame
        sizeToFit()
        frame = CGRect(
            x: preserveCenter ? oldFrame.centerX - 0.5 * frame.size.width : oldFrame.origin.x,
            y: oldFrame.origin.y,
            width: frame.size.width,
            height: oldFrame.size.height
        )
    }
}
