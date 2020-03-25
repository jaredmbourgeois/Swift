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

//public protocol ViewableConfig {
//    var frame: CGRect { get }
//    var backgroundColor: UIColor { get }
//    var cornerRadius: CGFloat { get }
//}
//
//public protocol ConfigurableView {
//    init<T: ViewableConfig>(_ config: T)
//    func update<T: ViewableConfig>(_ config: T) -> Void
//}
//
//public protocol ViewableTextConfig: ViewableConfig {
//    var font: UIFont { get }
//    var numberOfLines: Int { get }
//    var textAlignment: NSTextAlignment { get }
//    var textColor: UIColor { get }
//    var text: String { get }
//}
//
//public protocol ConfigurableTextView {
//    init<T: ViewableTextConfig>(_ config: T)
//    func update<T: ViewableTextConfig>(_ config: T) -> Void
//}

public protocol Identifiable {
    var id: String { get }
}

public protocol IdentifiableProperties {
    func updateIDs(save: Bool) -> Void
}

protocol Updatable {
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
    init(_ size: Format.Size)
    var size: Format.Size { get }
}
