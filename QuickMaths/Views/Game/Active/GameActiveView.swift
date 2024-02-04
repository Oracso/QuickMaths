//
//  GameActiveView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct GameActiveView: View {
    @ObservedObject var gameManager: GameManager
    var body: some View {
        VStack {
            
            Text(gameManager.questionManager.question)
                .font(.system(size: 36))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 15)
            
            Text(gameManager.questionManager.result.displayText())
            
            Spacer()
            
            KeyboardView(inputText: $gameManager.questionManager.inputText, answer: $gameManager.questionManager.answer, questionTries: $gameManager.dataObject.questionAttempts, submitAnswer: gameManager.submitAnswer, gameType: gameManager.gameType)
            
            Button("Cancel Game") {
                gameManager.stopGame()
            }
            
        }
    }
}

#Preview {
    VStack {
        GameCountdownView(timerProgress: .constant(0.5), secondsRemaining: .constant(30))
        Spacer()
        GameActiveView(gameManager: GameManager(gameType: .addition))
        Spacer()
    }
}
