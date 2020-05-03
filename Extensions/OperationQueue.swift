//
//  Extensions/OperationQueue.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation
import Dispatch

extension OperationQueue {
    static var currentOrMain: OperationQueue {
        OperationQueue.current ?? OperationQueue.main
    }
}
