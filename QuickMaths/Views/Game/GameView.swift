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
                
            case .active:
                GameActiveView(gameManager: gameManager)
            case .results:
                GameResultsView(gameManager: gameManager)
            case .stop:
                dismiss()
            }
            GameCountdownView(timerProgress: $gameManager.timerManager.timerProgress, secondsRemaining: $gameManager.timerManager.secondsRemaining)
            
//            Spacer()
//            
//            if gameManager.gameStarted {
//                
//            } else {
//                
//            }
//            
//            Spacer()
            
        }
        
        
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
        
    }
}

#Preview {
    NavigationStack {
        GameView(gameManager: .example)
    }
}
