//
//  Extensions/NSManagedObject.swift
//
//  Created by Jared Bourgeois on 2/29/20
//  mail@jaredbourgeois.com
//  
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import CoreData

extension NSManagedObject {
    public static func fetchObject<T: NSManagedObject>(
        _ context: NSManagedObjectContext,
        key: String? = nil,
        value: Any? = nil,
        predicateConditions: [NSPredicate.Condition]? = nil
    ) -> T? {
        return T.fetchObjects(context, key: key, value: value, predicateConditions: predicateConditions).first
    }
 
    public static func fetchObjects<T: NSManagedObject>(
        _ context: NSManagedObjectContext,
        key: String? = nil,
        value: Any? = nil,
        predicateConditions: [NSPredicate.Condition]? = nil,
        sortKey: String? = nil,
        ascending: Bool = true,
        sortKeyAscendings: [(String, Bool)]? = nil
    ) -> [T] {
        let request: NSFetchRequest = T.fetchRequest()
        
        var totalPredicateConditions: [NSPredicate.Condition] = []
        if let key = key, let value = value {
            totalPredicateConditions.append(NSPredicate.Condition(key: key, relation: .equal, value: value))
        }
        if let predicateConditions = predicateConditions {
            totalPredicateConditions.append(contentsOf: predicateConditions)
        }
        if totalPredicateConditions.count > 0 {
            request.predicate = NSPredicate.from(conditions: totalPredicateConditions)
        }
        
        var totalSortKeyAscendings: [(String, Bool)] = []
        if let sortKey: String = sortKey {
            totalSortKeyAscendings.append((sortKey, ascending))
        }
        if let sortKeyAscendings: [(String, Bool)] = sortKeyAscendings {
            totalSortKeyAscendings.append(contentsOf: sortKeyAscendings)
        }
        if totalSortKeyAscendings.count > 0 {
            var sortDescriptors: [NSSortDescriptor] = []
            for (sortKey, ascending) in totalSortKeyAscendings {
                sortDescriptors.append(NSSortDescriptor(key: sortKey, ascending: ascending))
            }
            request.sortDescriptors = sortDescriptors
        }
        let result: [T]? = try? context.fetch(request) as? [T]
        return result ?? []
    }
    
    public func saveSucces() -> Bool {
        saveSuccess(printError: nil)
    }
    
    public func saveSuccess(printError text: String?) -> Bool {
        managedObjectContext != nil ? managedObjectContext!.saveSuccess(printError: text) : false
    }
}
