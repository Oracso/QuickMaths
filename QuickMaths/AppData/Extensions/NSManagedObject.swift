//
//  NSManagedObject.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    class func customObjectsFetchRequest(_ type: FetchRequestType, context: NSManagedObjectContext) -> [NSManagedObject] {
        
        let fetchRequest = customiseFetchRequest(type)
        
        let examples: [NSManagedObject]
        
        do {
            examples = try context.fetch(fetchRequest)
        } catch {
            examples = []
        }
        
        return examples
    }
    
    class private func customiseFetchRequest(_ type: FetchRequestType) -> NSFetchRequest<NSManagedObject> {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: entity().name ?? "Unwrap Fail")
        
        switch type {
        case .single:
            request.fetchLimit = 1
        case .all:
            print("")
        case .objectStore:
            print("")
        }
        
        return request
    }
    
    enum FetchRequestType {
        case single
        case all
        case objectStore
    }
    
}

