//
//  GameView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var gameManager: GameManager
    var body: some View {
        
        VStack {
            switch gameManager.gameStatus {
            case .config:
                GameConfigView(gameManager: gameManager)
            case .active:
                // TODO: Turn this and below into view
                VStack {
                    GameCountdownView(timerProgress: $gameManager.timerManager.timerProgress, secondsRemaining: $gameManager.timerManager.secondsRemaining)
                    Spacer()
                    GameActiveView(gameManager: gameManager)
                    Spacer()
                }
                .navigationBarBackButtonHidden()
                .toolbar(.hidden, for: .tabBar)
            case .results:
                VStack {
                    GameCountdownView(timerProgress: $gameManager.timerManager.timerProgress, secondsRemaining: $gameManager.timerManager.secondsRemaining)
                    Spacer()
                    GameResultsView(gameManager: gameManager)
                    Spacer()
                }
                .navigationBarBackButtonHidden()
                .toolbar(.hidden, for: .tabBar)
            case .stop:
                // TODO: Clunky but works
                Text("")
//                EmptyView()
                    .onAppear() {
                        dismiss()
                        
                    }
            }
            
            
        }
        
        
        
        
    }
}

#Preview {
    NavigationStack {
        GameView(gameManager: .example)
    }
}
