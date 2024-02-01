//
//  QuickMathsApp.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

@main
struct QuickMathsApp: App {


//    init() {
//        let defaults = UserDefaults.standard
//        if defaults.bool(forKey: "hasLaunched") == true {
//            print("Not first launch")
//            // Code
//        } else {
//            // MARK: - First Launch Code
//            print("First Launch")
//            defaults.set(true, forKey: "hasLaunched")
////            let _ = CoreDataPreviewManager(CoreDataManager.shared.container.viewContext)
//        }
//    }
    
//    let coreDataManager = CoreDataManager.shared
    
    @Environment(\.scenePhase) var scenePhase
    
//    @StateObject var appDataStore = AppDataStore(CoreDataManager.shared.container.viewContext)

//    @StateObject var viewEditingManager = ViewEditingManager(CoreDataManager.shared.container.viewContext)

//    let previewManager = CoreDataPreviewManager(CoreDataManager.shared.container.viewContext)

    @StateObject var database = Database()
    
    var body: some Scene {
        WindowGroup {
            
             TabBarView()
            
                .environmentObject(database)
            
//                .environment(\.managedObjectContext, CoreDataManager.shared.container.viewContext)
            
//                .environmentObject(appDataStore)

//                .environmentObject(viewEditingManager)
            
        }

        .onChange(of: scenePhase) { phase, _ in
            switch phase {
            case .background:
                print("Unsure whether or how to save here yet")
                // actually, do we want CoreData to save just bc we dip out?
                print("background")
            case .inactive:
                print("scene phase -> inactive")
            case .active:
                print("scene phase -> active")
            @unknown default:
                print("scene phase -> unknown - update switch statement")
            }
        }


    }
}
