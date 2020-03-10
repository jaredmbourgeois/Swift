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

typealias UniqueID = String

extension UniqueID {
    init() {
        self.init(SHA256.hash(data: (Date.milliseconds() + Int64.random(in: -99 ..< 99)).data).map{ String(format: "%x", $0) }.joined())
    }
}
