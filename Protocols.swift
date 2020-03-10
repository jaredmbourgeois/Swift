//
//  Protocols.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

public protocol Identifiable {
    var id: String { get }
}

public protocol Updatable {
    var updateDate: Date { get }
}

public protocol Colorable {
    func update(mainColor: UIColor?, textColor: UIColor?) -> Void
}

public protocol Dismissable {
    var dismissesOnTouch: Bool? { get set }
    var dismissingSplitViewController: UISplitViewController? { get set }
    func dismiss() -> Void
}

public protocol Sizable {
    static func number(from size: Format.Size) -> NSNumber
    static func size(from number: NSNumber) -> Format.Size
}
