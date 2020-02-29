//
//  Extensions/UISplitViewControllerDelegate.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension UISplitViewControllerDelegate {
    public func dismissDetailViewControllerHandler(_ dismissDetailViewController: UISplitViewController.DismissDetailViewController) -> Void {
        dismissDetailViewController.splitViewController.dismiss(animated: dismissDetailViewController.animated, completion: dismissDetailViewController.handlerCompletionHandler)
    }
}