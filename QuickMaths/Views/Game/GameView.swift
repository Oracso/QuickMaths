//
//  GameView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameManager: GameManager
    
    func timeOfQuestion() {
        gameManager.gameDataObject.roundDuration += 1
        gameManager.gameDataObject.roundQuestionDuration[gameManager.gameDataObject.roundDuration] = gameManager.gameDataObject.questionNumber
    }
    
    var body: some View {
        VStack {
            GameCountdownView(timerProgress: $gameManager.timerManager.timerProgress, secondsRemaining: $gameManager.timerManager.secondsRemaining)
            
            
            
        }
        .onAppear() {
            gameManager.timerManager.hasTimerStarted = true
        }
        
        .onReceive(gameManager.timerManager.timer) { timer in
            guard gameManager.timerManager.hasTimerStarted else { return }
            if gameManager.timerManager.hasTimerStarted && gameManager.timerManager.secondsRemaining > 0 {
                gameManager.timerManager.secondsRemaining -= 1
                gameManager.secondsRemaining -= 1
                timeOfQuestion()
            } else if gameManager.timerManager.secondsRemaining == 0 {
                gameManager.timerManager.hasTimerStarted = true
                gameManager.timerManager.hasTimerStarted = false
                gameManager.roundComplete = true
                
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        GameView(gameManager: .example)
    }
}
