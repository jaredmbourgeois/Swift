//
//  AnyCancellable.swift
//  streak
//
//  Created by Jared Bourgeois on 11/15/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import Foundation
import Combine

extension AnyCancellable {
    static let empty = AnyCancellable({})
}

extension Array where Element: AnyCancellable {
    func cancel() -> Void {
        forEach { $0.cancel() }
    }
}
