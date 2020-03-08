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
    public static let zero: String = "0"
    public static func ids(from identifiables: [Identifiable]?, separator: String = ",") -> String {
        var ids = String.empty
        if let identifiables = identifiables {
            var identifiable: Identifiable
            for index in 0 ..< identifiables.count {
                identifiable = identifiables[index]
                ids += "\(identifiable.id)\(separator)"
            }
            if ids.count >= separator.count { ids.removeLast(separator.count) }
        }
        return ids
    }
}
