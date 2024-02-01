//
//  TabBarView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct TabBarView: View {
    
//    @EnvironmentObject var ads: AppDataStore
    
    var body: some View {
        TabView {
            GameSelectionView()
                .tabItem {
                    Label("Games", systemImage: "gamecontroller")
                }
            
            AllGameLogsView()
                .tabItem {
                    Label("Saved Logs", systemImage: "bookmark")
                }
            
        }
        
    }
}

#Preview {
    TabBarView()
//        .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
}
