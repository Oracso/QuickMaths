//
//  NSPersistentContainerSubClass.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData

class NSPersistentContainerSubClass: NSPersistentContainer {
    
}

extension NSManagedObjectContext {
    func saveIfChanges() {
            guard self.hasChanges else { return }
            do {
                try self.save()
            } catch let error as NSError {
                print("Error: \(error), \(error.userInfo)")
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                // The fatalError() causes the app to crash, may be useful during development but DO NOT SHIP
            }
        }
}

