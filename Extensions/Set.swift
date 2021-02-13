//
//  Set.swift
//  streak
//
//  Created by Jared Bourgeois on 1/23/21.
//  Copyright © 2021 jaredmbourgeois. All rights reserved.
//

import Foundation
import Combine

extension Set where Element: AnyCancellable {
    public func cancel() {
        forEach { $0.cancel() }
    }
}
