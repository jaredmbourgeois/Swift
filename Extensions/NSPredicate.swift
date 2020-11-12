//
//  NSPredicate.swift
//  streak
//
//  Created by Jared Bourgeois on 9/3/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import Foundation

extension NSPredicate {
    
    public enum Comparison {
        case equal
        case notEqual
        case lessThan
        case lessThanEqualTo
        case greaterThan
        case greaterThanEqualTo
    }
    
    convenience init(key: String, comparison: Comparison, value: CVarArg) {
        switch comparison {
        case .equal: self.init(format: "\(key) == %@", value)
        case .notEqual: self.init(format: "\(key) != %@", value)
        case .lessThan: self.init(format: "\(key) < %@", value)
        case .lessThanEqualTo: self.init(format: "\(key) <= %@", value)
        case .greaterThan: self.init(format: "\(key) > %@", value)
        case .greaterThanEqualTo: self.init(format: "\(key) >= %@", value)
        }
    }
    
}
