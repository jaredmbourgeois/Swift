//
//  Extensions/UITableViewCell.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation
import UIKit

extension UITableViewCell {
    private static var _reuseIdentifier: String? = nil
    public static var reuseIdentifier: String {
        let cachedReuseIdentifier: String
        if let reuseIdentifier = Self._reuseIdentifier {
            cachedReuseIdentifier = reuseIdentifier
        } else {
            let reuseIdentifer = String(describing: Self.self)
            Self._reuseIdentifier = reuseIdentifer
            cachedReuseIdentifier = reuseIdentifer
        }
        return cachedReuseIdentifier
    }
}
