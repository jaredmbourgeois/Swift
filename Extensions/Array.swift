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
    var isNotEmpty: Bool { self.count > 0 }
    
    func any(iteration: (Element) -> Bool) -> Bool {
        var anyTrue = false
        forEach { element in
            if iteration(element) {
                anyTrue = true
            }
        }
        return anyTrue
    }
    
    func isValidIndex(_ index: Int) -> Bool {
        index > -1 && index < count
    }
    
    func max<T: Comparable>(iteration: (Element) -> T) -> T? {
        var max: T? = nil
        forEach { element in
            if let currentMax = max {
                let thisElement = iteration(element)
                if thisElement > currentMax {
                    max = thisElement
                }
            } else {
                max = iteration(element)
            }
        }
        return max
    }
    
    func min<T: Comparable>(iteration: (Element) -> T) -> T? {
        var min: T? = nil
        forEach { element in
            if let currentMin = min {
                let thisElement = iteration(element)
                if thisElement < currentMin {
                    min = thisElement
                }
            } else {
                min = iteration(element)
            }
        }
        return min
    }
    
    mutating func append(_ anotherArray: [Element]) {
        self += anotherArray
    }
    
    func forEachIndex(_ iteration: (Int,Element) -> Void) {
        for index in 0 ..< count {
            iteration(index,self[index])
        }
    }
    
    func mapIndex<T>(_ iteration: (Int,Element) -> T) -> [T] {
        if isNotEmpty {
            var index = Int.zero
            return map { element in
                let result = iteration(index, element)
                index += 1
                return result
            }
        } else {
            return []
        }
    }

    func optional(at index: Int) -> Element? {
        var element: Element? = nil
        if index >= 0 && index < count {
            element = self[index]
        }
        return element
    }
}

extension Array where Element: Equatable {
    
    mutating func removeAll(_ elements: [Element]) {
        for element in elements { removeAll(element) }
    }
    
    mutating func removeAll(_ element: Element) {
        let indexesToRemove: [Int] = indexes(for: element)
        var newArray: [Element] = []
        var removeIndex: Bool
        for index in 0 ..< count {
            removeIndex = false
            for removalIndex in 0 ..< indexesToRemove.count {
                if index == indexesToRemove[removalIndex] {
                    removeIndex = true
                }
            }
            if !removeIndex {
                newArray.append(self[index])
            }
        }
        self = newArray
    }
    
    mutating func removeFirst(_ elements: [Element], compareByReference: Bool = false, fromEnd: Bool = false) {
        for element in elements {
            removeFirst(element, compareByReference: compareByReference, fromEnd: fromEnd)
        }
    }
    
    mutating func removeFirst(
        _ element: Element,
        compareByReference: Bool = false,
        fromEnd: Bool = false
    ) {
        if let index = index(
            for: element,
            compareByReference: compareByReference,
            fromEnd: fromEnd
        ) { remove(at: index) }
    }
    
    func index(for element: Element, compareByReference: Bool = false, fromEnd: Bool = false) -> Int? {
        let startIndex = fromEnd ? count - 1 : 0
        let endIndex = fromEnd ? 0 : count - 1
        var comparisonResult: Bool
        if compareByReference {
            for index in startIndex ... endIndex {
                comparisonResult = self[index] as AnyObject === element as AnyObject
                if comparisonResult {
                    return index
                }
            }
        } else {
            for index in startIndex ... endIndex {
                comparisonResult = self[index] == element
                if comparisonResult {
                    return index
                }
            }
        }
        return nil
    }
    
    func indexes(for element: Element) -> [Int] {
        var indices: [Int] = []
        for index in 0 ..< count {
            if self[index] == element { indices.append(index) }
        }
        return indices
    }
}
