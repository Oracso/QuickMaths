//
//  GameConfigView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameConfigView: View {
    let gameType: GameType
    @StateObject var gameConfig = GameConfigObject()
    var body: some View {
        VStack {
            
            TimerConfigView(timerLength: $gameConfig.timerLength)
                .padding(.bottom)
            
            GameConfigSlidersView(gameConfig: gameConfig)
                .padding(.bottom)
            
            NavigationLink {
                GameView(gameManager: .createGameManager(gameType, gameConfig))
            } label: {
                Text("Play")
            }

            
            // TODO: - Add This
//            GameConfigHighScoreView()
            
        }
        
        .navigationTitle("Game Setup")
        
    }
}

#Preview {
    NavigationStack {
        GameConfigView(gameType: .addition)
    }
}
