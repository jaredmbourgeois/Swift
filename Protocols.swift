//
//  Protocols.swift
//  streak
//
//  Created by Jared Bourgeois on 8/10/19.
//  Copyright © 2019 jaredmbourgeois. All rights reserved.
//

import UIKit

protocol Colorable {
    func update(mainColor: UIColor?, textColor: UIColor?) -> Void
}

protocol Sizable {
    static func number(from size: Format.Size) -> NSNumber
    static func size(from number: NSNumber) -> Format.Size
}
