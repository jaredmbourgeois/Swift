//
//  extensions/NSLayoutConstraint.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import UIKit

extension NSLayoutConstraint {
    
    public struct ActivationRequest {
        public let constraintsToActivate: [NSLayoutConstraint]
        public let constraintsToDeactivate: [NSLayoutConstraint]
        
        public init(
            activate: [NSLayoutConstraint] = [],
            deactivate: [NSLayoutConstraint] = []
        ) {
            self.constraintsToActivate = activate
            self.constraintsToDeactivate = deactivate
        }
        
        public init(
            activate: NSLayoutConstraint,
            deactivate: [NSLayoutConstraint] = []
        ) {
            self.constraintsToActivate = [ activate ]
            self.constraintsToDeactivate = deactivate
        }
        
        public init(
            activate: [NSLayoutConstraint] = [],
            deactivate: NSLayoutConstraint
        ) {
            self.constraintsToActivate = activate
            self.constraintsToDeactivate = [ deactivate ]
        }
        
        public init(
            activate: NSLayoutConstraint,
            deactivate: NSLayoutConstraint
        ) {
            self.constraintsToActivate = [ activate ]
            self.constraintsToDeactivate = [ deactivate ]
        }
        
        public init(
            activate: NSLayoutConstraint?,
            deactivate: NSLayoutConstraint?
        ) {
            self.constraintsToActivate = activate != nil ? [ activate! ] : []
            self.constraintsToDeactivate = deactivate != nil ? [ deactivate! ] : []
        }
        
        public init(activate constraint: NSLayoutConstraint) {
            self.constraintsToActivate = [ constraint ]
            self.constraintsToDeactivate = []
        }
        
        public init(activate constraints: [NSLayoutConstraint]) {
            self.constraintsToActivate = constraints
            self.constraintsToDeactivate = []
        }
        
        public init(deactivate constraint: NSLayoutConstraint) {
            self.constraintsToActivate = [ ]
            self.constraintsToDeactivate = [ constraint ]
        }
        
        public init(deactivate constraints: [NSLayoutConstraint]) {
            self.constraintsToActivate = []
            self.constraintsToDeactivate = constraints
        }
        
        public init(_ requests: [NSLayoutConstraint.ActivationRequest]) {
            self.constraintsToActivate = requests.reduce(into: []) { appended, request in
                appended.append(request.constraintsToActivate)
            }
            self.constraintsToDeactivate = requests.reduce(into: []) { appended, request in
                appended.append(request.constraintsToDeactivate)
            }
        }
        
        public init(_ requests: [NSLayoutConstraint.ActivationRequest?]) {
            self.constraintsToActivate = requests.reduce(into: []) { appended, request in
                if let request = request {
                    appended.append(request.constraintsToActivate)
                }
            }
            self.constraintsToDeactivate = requests.reduce(into: []) { appended, request in
                if let request = request {
                    appended.append(request.constraintsToDeactivate)
                }
            }
        }
        
        public func combine(_ otherRequest: NSLayoutConstraint.ActivationRequest) -> NSLayoutConstraint.ActivationRequest {
            NSLayoutConstraint.ActivationRequest.combine([self, otherRequest])
        }
        
        public static func combine(_ requests: [NSLayoutConstraint.ActivationRequest]) -> NSLayoutConstraint.ActivationRequest {
            let placeholderConstraint = NSLayoutConstraint()
            var activateCount = Int.zero
            var deactivateCount = Int.zero
            requests.forEach { request in
                activateCount += request.constraintsToActivate.count
                deactivateCount += request.constraintsToDeactivate.count
            }
            var combinedConstraintsToActivate: [NSLayoutConstraint] = Array<NSLayoutConstraint>(repeating: placeholderConstraint, count: activateCount)
            var combinedConstraintsToActivateIndex = Int.zero
            var combinedConstraintsToDeactivate: [NSLayoutConstraint] = Array<NSLayoutConstraint>(repeating: placeholderConstraint, count: deactivateCount)
            var combinedConstraintsToDeactivateIndex = Int.zero
            requests.forEach { request in
                request.constraintsToActivate.forEach { constraintToActivate in
                    combinedConstraintsToActivate[combinedConstraintsToActivateIndex] = constraintToActivate
                    combinedConstraintsToActivateIndex += 1
                }
                request.constraintsToDeactivate.forEach { constraintToDeactivate in
                    combinedConstraintsToDeactivate[combinedConstraintsToDeactivateIndex] = constraintToDeactivate
                    combinedConstraintsToDeactivateIndex += 1
                }
            }
            return NSLayoutConstraint.ActivationRequest(
                activate: combinedConstraintsToActivate,
                deactivate: combinedConstraintsToDeactivate
            )
        }
        
        public static func fulfill(_ requests: [NSLayoutConstraint.ActivationRequest]) -> Void {
            fulfill(combine(requests))
        }
        
        public static func fulfill(_ request: NSLayoutConstraint.ActivationRequest) -> Void {
            NSLayoutConstraint.deactivate(request.constraintsToDeactivate)
            NSLayoutConstraint.activate(request.constraintsToActivate)
        }
        
        public func fulfill() -> Void {
            NSLayoutConstraint.deactivate(constraintsToDeactivate)
            NSLayoutConstraint.activate(constraintsToActivate)
        }
        
    }
}
