//
//  GameManager.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

class GameManager: ObservableObject {
    
    internal init(gameType: GameType, gameNumberFreq: Double = 2.0, gameNumberRange: Double = 10.0) {
        self.gameType = gameType
        self.gameNumberFreq = gameNumberFreq
        self.gameNumberRange = gameNumberRange
    }
    
    
    let gameType: GameType
    
    var gameNumberFreq = 2.0
    var gameNumberRange = 10.0
    
    @Published var gameDataObject = GameDataObject()
    
    @Published var gameQuestionManager = GameQuestionManager()
    
    @Published var timerManager = TimerManager()
    
    
    @Published var questionsStarted = false
    
    @Published var roundComplete = false
    
    @Published var secondsRemaining = 0
    
}


extension GameManager {
    static let example = GameManager(
        gameType: .addition
    )
}



// TODO: convert this into init
extension GameManager {
    static func createGameManager(_ gameType: GameType, _ gameConfig: GameConfigObject) -> GameManager {
        let gameManager = GameManager(gameType: gameType)
        gameManager.gameNumberFreq = gameConfig.gameNumberFreq
        gameManager.gameNumberRange = gameConfig.gameNumberRange
        
        gameManager.timerManager.timerDuration = TimerManager.lengthToSeconds(gameConfig.timerLength)
        gameManager.timerManager.secondsRemaining = gameManager.timerManager.timerDuration
        
        
        return gameManager
    }
}


