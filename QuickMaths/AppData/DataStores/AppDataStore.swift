//
//  AppDataStore.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData

class AppDataStore: ObservableObject {
    
    let context: NSManagedObjectContext
    
    @Published var refreshID = UUID()
    
    @Published var objects: AppObjectStores
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
        self.objects = AppObjectStores(context)
    }
    
}



extension AppDataStore {
    func refresh() { refreshID = UUID() }
}




