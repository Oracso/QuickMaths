//
//  QuickMathsApp.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

@main
struct QuickMathsApp: App {

    let coreDataManager = CoreDataManager.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject var appDataStore = AppDataStore(CoreDataManager.shared.container.viewContext)

    let previewManager = CoreDataPreviewManager(CoreDataManager.shared.container.viewContext)
    
    var body: some Scene {
        WindowGroup {
             TabBarView()
                .environment(\.managedObjectContext, CoreDataManager.shared.container.viewContext)
                .environmentObject(appDataStore)
        }

        .onChange(of: scenePhase) { phase, _ in
            switch phase {
            case .background:
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
