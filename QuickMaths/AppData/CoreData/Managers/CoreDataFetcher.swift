//
//  CoreDataFetcher.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import Foundation
import CoreData

struct CoreDataFetcher {
    
    let context: NSManagedObjectContext
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchAllObjects<T: NSManagedObject>(_ entityType: EntityType) -> [T] {
        fetchAllObjectsFromEntityClass(entityType.entityClass()) as! [T]
    }
    
    private func fetchAllObjectsFromEntityClass(_ entityClass: NSManagedObject.Type) -> [NSManagedObject] {
        entityClass.customObjectsFetchRequest(.all, context: context)
    }
    
}





