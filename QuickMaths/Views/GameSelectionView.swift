//
//  GameSelectionView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameSelectionView: View {
    @EnvironmentObject var ads: AppDataStore
    var body: some View {
        NavigationStack {
            List {
                ForEach(GameType.allCases) { gameType in
                    NavigationLink {
                        GameView(gameManager: GameManager(gameType: gameType))
                    } label: {
                        Text(gameType.rawValue.capitalized)
                    }
                }
            }
            .navigationTitle("Games")
        }
    }
}

#Preview {
    GameSelectionView()
        .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
}
