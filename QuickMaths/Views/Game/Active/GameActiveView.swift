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
            
            Text(gameManager.questionManager.result.displayText())
            
            KeyboardView(inputText: $gameManager.questionManager.inputText, answer: $gameManager.questionManager.answer, questionTries: $gameManager.dataObject.questionAttempts, submitAnswer: gameManager.submitAnswer)
                .disabled(!gameManager.gameStarted)
            
            
        }
    }
}

#Preview {
    GameActiveView(gameManager: GameManager(gameType: .addition))
}
