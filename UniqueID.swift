//
//  UniqueID.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation
import CryptoKit

enum UniqueID {
    static var new: String {
        SHA256.hash(data: Date.milliseconds().data).map{ String(format: "%x", $0) }.joined()
    }
}
