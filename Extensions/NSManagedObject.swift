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
        predicate: NSPredicate? = nil,
        key: String? = nil,
        comparison: NSPredicate.Comparison = .equal,
        value: CVarArg? = nil
    ) -> T? {
        self.fetchObjects(
            context,
            predicate: predicate,
            key: key,
            comparison: comparison,
            value: value
        ).first
    }
 
    public static func fetchObjects<T: NSManagedObject>(
        _ context: NSManagedObjectContext,
        predicate: NSPredicate? = nil,
        key: String? = nil,
        comparison: NSPredicate.Comparison = .equal,
        value: CVarArg? = nil,
        sortKey: String? = nil,
        ascending: Bool = true,
        sortKeyAscendings: [(String, Bool)]? = nil
    ) -> [T] {
        let request: NSFetchRequest<T> = self.fetchRequest(context, predicate: predicate, key: key, comparison: comparison, value: value, sortKey: sortKey, ascending: ascending, sortKeyAscendings: sortKeyAscendings)

        do { return try context.fetch(request) as [T] }
        catch { return [] }
    }
    
    public static func fetchRequest<T: NSManagedObject>(
        _ context: NSManagedObjectContext,
        predicate: NSPredicate? = nil,
        key: String? = nil,
        comparison: NSPredicate.Comparison = .equal,
        value: CVarArg? = nil,
        sortKey: String? = nil,
        ascending: Bool = true,
        sortKeyAscendings: [(String, Bool)]? = nil
    ) -> NSFetchRequest<T> {
        let request = NSFetchRequest<T>(entityName: Self.self.description())

        var predicates: [NSPredicate] = []
        if let predicate = predicate {
            predicates.append(predicate)
        }
        if let key = key, let value = value {
            predicates.append(NSPredicate(key: key, comparison: comparison, value: value))
        }
        switch predicates.count {
        case 1: request.predicate = predicates[0]
        case 2: request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        default: request.predicate = nil
        }
        
        var totalSortKeyAscendings: [(String, Bool)] = []
        if let sortKey: String = sortKey {
            totalSortKeyAscendings.append((sortKey, ascending))
        }
        if let sortKeyAscendings: [(String, Bool)] = sortKeyAscendings {
            totalSortKeyAscendings.append(contentsOf: sortKeyAscendings)
        }
        if totalSortKeyAscendings.isNotEmpty {
            var sortDescriptors: [NSSortDescriptor] = []
            for (sortKey, ascending) in totalSortKeyAscendings {
                sortDescriptors.append(NSSortDescriptor(key: sortKey, ascending: ascending))
            }
            request.sortDescriptors = sortDescriptors
        }
        return request
    }

    public func saveSucces() -> Bool {
        saveSuccess(printError: nil)
    }
    
    public func saveSuccess(printError text: String?) -> Bool {
        managedObjectContext != nil ? managedObjectContext!.saveSuccess(printError: text) : false
    }
}
