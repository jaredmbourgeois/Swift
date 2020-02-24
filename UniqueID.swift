//
//  UniqueID.swift
//
//  Created by Jared Bourgeois on 2/22/20.
//  Copyright © 2020 Jared Bourgeois. All rights reserved.
//

import Foundation
import CryptoKit

enum UniqueID {
    static var new: String {
        SHA256.hash(data: Date.milliseconds().data).map{ String(format: "%x", $0) }.joined()
    }
}
