//
//  Extensions/Array.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension Array {
    mutating func append(_ anotherArray: [Element]) {
        self += anotherArray
    }
    
    func safeIndex(from value: Int) -> Int? {
        var safeIndex: Int?
        if count > 0 {
            safeIndex = value > endIndex ?
                endIndex :
                value < 0 ?
                    0 :
                    value
        }
        return safeIndex
    }
    
    func safeElement(at index: Int) -> Element? {
        var element: Element?
        if let safeIndex = safeIndex(from: index) {
            element = self[safeIndex]
        }
        return element
    }
}
