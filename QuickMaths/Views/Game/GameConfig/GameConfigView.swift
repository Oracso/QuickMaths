//
//  GameConfigView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameConfigView: View {
    @ObservedObject var gameManager: GameManager
    var body: some View {
        VStack {
            
            GameConfigHighScoreView(gameManager: gameManager)
            
            Spacer()
            
            TimerConfigView(timerLength: $gameManager.timerManager.timerLength)
                .padding(.bottom)
            
            GameConfigSlidersView($gameManager.numberFreq, $gameManager.numberRange)
                .padding(.bottom)
            
            Button {
                gameManager.configureGame()
            } label: {
                GameButton(text: "Play", count: 4)
            }
            .disabled(gameManager.timerManager.timerLength == .zero)
            
            Spacer()
            
        }
        
        .navigationTitle("Game Setup")
        
    }
}

#Preview {
    NavigationStack {
        GameConfigView(gameManager: GameManager(gameType: .addition))
            .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
    }
}
