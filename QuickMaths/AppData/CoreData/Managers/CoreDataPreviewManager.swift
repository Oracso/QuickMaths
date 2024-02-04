//
//  CoreDataPreviewManager.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import Foundation
import CoreData
import SwiftUI


struct CoreDataPreviewManager {
    
    init(_ context: NSManagedObjectContext, isStatic: Bool = false) {
        self.context = context
        
        if isStatic == false {
            initExampleData()
        }
    }
    
    let context: NSManagedObjectContext
    
    func initExampleData() {
        _ = GameLog.example1(context)
        _ = GameLog.example2(context)
        _ = GameLog.example3(context)
        _ = GameLog.example4(context)
        context.saveIfChanges()
    }
    
}


