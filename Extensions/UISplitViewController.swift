//
//  Extensions/UISplitViewController.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UISplitViewController {
    public struct DismissDetailViewController {
        public typealias HandlerCompletionHandler = () -> Void
        
        public unowned let splitViewController: UISplitViewController
        public let handlerCompletionHandler: HandlerCompletionHandler?
        public let animated: Bool
        
        public init (splitViewController: UISplitViewController, animated: Bool, handlerCompletionHandler: HandlerCompletionHandler?) {
            self.splitViewController = splitViewController
            self.handlerCompletionHandler = handlerCompletionHandler
            self.animated = animated
        }
    }
}
