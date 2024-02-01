//
//  GameSelectionView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameSelectionView: View {
    @EnvironmentObject var database: Database
    var body: some View {
        NavigationStack {
            List {
                ForEach(GameType.allCases) { gameType in
                    NavigationLink {
//                        GameView(gameManager: <#T##GameManager#>)
//                        GameConfigView(gameType: gameType)
                    } label: {
                        Text(gameType.gameName)
                    }
                }
                
                
                
            }
            .navigationTitle("Games")
            
            
 
            
            
            
        
        
        
            
        }
    }
}

#Preview {
    GameSelectionView()
        .environmentObject(Database())
}
