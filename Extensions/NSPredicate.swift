//
//  Extensions/NSPredicate.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension NSPredicate {
    public struct Condition {
        let linkWithAnd: Bool = true
        let key: String
        let relation: Relation
        let value: Any?
        
        public enum Relation: String {
            case equal = "="
            case notEqual = "!="
            case greaterThan = ">"
            case greaterThanEqualTo = ">="
            case lessThan = "<"
            case lessThanEqualTo = "<="
        }
    }
    
    public static func from(condition: Condition) -> NSPredicate { from(conditions: [condition]) }
    
    public static func from(conditions: [Condition]) -> NSPredicate {
        var string: String = String.empty
        var condition: Condition
        var link: String
        var valueFormat: String
        for index: Int in 0 ..< conditions.count {
            condition = conditions[index]
            switch index {
            case 0:
                valueFormat = condition.value != nil ? "%@" : "nil"
                string += "\(condition.key) \(condition.relation.rawValue) \(valueFormat)"
            default:
                link = condition.linkWithAnd == true ? "&&" : "||"
                valueFormat = "%@"
                string += " \(link) \(condition.key) \(condition.relation.rawValue) \(valueFormat)"
            }
        }
        return NSPredicate(format: string, conditions.compactMap{ $0.value })
    }
}
