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

public typealias UniqueID = String

extension UniqueID {
    public init() {
        self.init(SHA256.hash(data: (Date.milliseconds() / TimeInterval.random(in: 1_000_000 ..< 1_000_000_000)).data).map{ String(format: "%x", $0) }.joined())
    }
}
