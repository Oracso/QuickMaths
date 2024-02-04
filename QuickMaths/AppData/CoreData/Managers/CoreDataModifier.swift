//
//  CoreDataModifier.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData


struct CoreDataModifier {

    let context: NSManagedObjectContext
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    
    // MARK: - Create Entity
    
    func createEntity(_ entityType: EntityType) -> NSManagedObject {
        switch entityType {
        case .gameLog:
            return createGameLog()
        case .XXX:
            return createXXX()
        }
    }
    
    
    func createGameLog() -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        return example
    }
    
    
    func createXXX() -> XXX {
        let example = XXX(context: context)
        example.id = UUID()
        return example
    }
    



    // MARK: - Delete Entity
    
    // func deleteObject(object: NSManagedObject) {
    //     context.delete(object)
    // }
    
    
    
}

