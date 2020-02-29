//
//  Extensions/URLResponse.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation

extension URLResponse {
    public func isValid(data: Data?, error: Error?) -> Bool {
        return URLResponse.isValid(self, data: data, error: error)
    }
    
    public static func isValid(_ response: URLResponse?, data: Data?, error: Error?) -> Bool {
        return data != nil && error == nil && response != nil ? true : false
    }
}
