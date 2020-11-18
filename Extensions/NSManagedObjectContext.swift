//
//  Extensions/NSManagedObjectContext.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import CoreData

extension NSManagedObjectContext {
    public func saveFatalError(_ save: Bool, printError: String? = nil) {
        if save && !self.saveSuccess(printError: printError) { fatalError() }
    }
    
    @discardableResult
    public func saveSuccess(printError: String? = nil) -> Bool {
        do {
            try save()
            return true
        } catch let error {
            if let printError = printError { print(printError + "ERROR:" + error.localizedDescription) }
            print("NSManagedObjectContext.saveSuccess() ERROR:" + error.localizedDescription)
            return false
        }
    }
    
    public func batchDelete(_ objectIDs: [NSManagedObjectID]) {
        NSManagedObjectContext.mergeChanges(
            fromRemoteContextSave: [ NSDeletedObjectsKey : objectIDs ],
            into: [ self ]
        )
    }
}
