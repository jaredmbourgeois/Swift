//
//  Extensions/String.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension String {
    public static let empty: String = ""
    public static let newLine = "\n"
    public static let space = " "
    public static let tab = "\t"
    public static let zero: String = "0"
    
    public static func separated(_ values: [String]?, separator: String = ",") -> String {
        var separatedValues = String.empty
        if let values = values {
            for value in values { separatedValues += "\(value)\(separator)"}
            if separatedValues.count >= separator.count { separatedValues.removeLast(separator.count) }
        }
        return separatedValues
    }
}
