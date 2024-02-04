//
//  DataDownloadView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI
import CoreData

struct DataDownloadView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @StateObject var dDManager = DataDownloadManager(CoreDataManager.shared.container.viewContext)
    
    @StateObject var entityTracker = EntitySelectionTracker()
    
    func resetToggleSelections() {
        entityTracker.createSelections()
    }

    func writeObjectsToJSON() {
        for entity in entityTracker.entities {
            if entity.selected {
                let objects = dDManager.fetcher.fetchAllObjects(entity.entity)
                // TODO: FORCE UNWRAP
                switch entity.entity {
                case .gameLog:
                    let castedObjects = objects as! [GameLog]
                    dDManager.writeObjectsAndAddURLToArray(castedObjects)
                }
            }
        }
    }
    
    func downloadFiles() {
        writeObjectsToJSON()
        ActivityViewController(activityItems: dDManager.finalURLs).initView()
        resetToggleSelections()
    }
    
    func entityRowDisplay(_ entityName: String, _ quantity: Int) -> String {
        return "\(entityName) (Q: \(quantity))"
    }
    
    var body: some View {
        List {
            Section("Entities") {
                ForEach($entityTracker.entities) { entity in
                    Toggle(entityRowDisplay(entity.wrappedValue.entity.rawValue, dDManager.fetcher.fetchAllObjects(entity.id).count), isOn: entity.selected)
                }
            }
            
            Button("Download Files") {
                downloadFiles()
            }
            
        }
        
        .navigationTitle("Download Data")
        
        .onAppear() {
            resetToggleSelections()
        }
        
    }
}

#Preview {
    NavigationStack {
        DataDownloadView()
            .environment(\.managedObjectContext, CoreDataManager.preview.container.viewContext)
    }
}





