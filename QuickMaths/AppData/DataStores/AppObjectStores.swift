//
//  AppObjectStores.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData


class AppObjectStores: ObservableObject {
    
    let context: NSManagedObjectContext
    
    @Published var gameLogOS: GameLogObjectStore
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
        self.gameLogOS = GameLogObjectStore(context)
    }
    
}



