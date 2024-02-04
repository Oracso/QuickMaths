//
//  GameLogObjectStore.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData

class GameLogObjectStore: NSObject, ObservableObject {
    
    @Published var gameLogs: [GameLog] = []
    private let controller: NSFetchedResultsController<GameLog>
    
    init(_ context: NSManagedObjectContext) {
        controller = NSFetchedResultsController(
            fetchRequest: GameLog.objectStoreFetchRequest(),
            managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        controller.delegate = self
        
        do {
            try controller.performFetch()
            gameLogs = controller.fetchedObjects ?? []
        } catch {
            print("failed to fetch gameLogs!")
        }
    }
}

extension GameLogObjectStore: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let fetchedObjects = controller.fetchedObjects as? [GameLog]
        else { return }
        gameLogs = fetchedObjects
    }
}
