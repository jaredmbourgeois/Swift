//
//  Protocols.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import CoreData
import UIKit

protocol Identifiable {
    var id: String { get }
}

extension String {
    static func ids(from identifiables: [Identifiable]?, separator: String = ",") -> String {
        if let identifiables = identifiables {
            return separated(identifiables.map({ $0.id }), separator: separator)
        } else {
            return String.empty
        }
    }
}

protocol IdentifiableProperties {
    func updateIDs(save: Bool) -> Void
}

protocol Updatable {
    var updateDate: Date { get }
}

protocol Colorable {
    func updateColor(_ color: UIColor?) -> Void
}

protocol Dismissable {
    var dismissesOnTouch: Bool? { get set }
    var dismissingSplitViewController: UISplitViewController? { get set }
    func dismiss() -> Void
}

protocol Sizable {
    init(_ size: Format.Size)
    var size: Format.Size { get }
}
