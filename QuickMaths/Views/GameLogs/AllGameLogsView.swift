//
//  AllGameLogsView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct AllGameLogsView: View {
    @EnvironmentObject var ads: AppDataStore
    var body: some View {
        NavigationStack {
            List(ads.objects.gameLogOS.gameLogs) { gameLog in
                NavigationLink {
                    GameLogDetailView(gameLog)
                } label: {
                    GameLogListView(gameLog)
                }
            }
            
            .navigationTitle("All Game Logs")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        StatsView()
                    } label: {
                        Image(systemName: "chart.xyaxis.line")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
            }
            
            .overlay {
                if ads.objects.gameLogOS.gameLogs.isEmpty {
                    ContentUnavailableView {
                        Label("No game logs found", systemImage: "tray.fill")
                    } description: {
                        Text("You need to play some games first")
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    AllGameLogsView()
        .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
}
