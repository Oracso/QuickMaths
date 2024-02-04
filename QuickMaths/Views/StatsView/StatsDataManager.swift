//
//  StatsDataManager.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 02/02/2024.
//

import Foundation

class StatsDataManager: ObservableObject {
    
    @Published var gameType: GameType = .addition

    @Published var gameDuration: TimerLength = .zero
    @Published var gameFreq = 2.0
    @Published var gameRange = 10.0
    
    @Published var filteredLogs: [GameLog] = []
    
    @Published var highestScore = 0
    @Published var lowestScore = 0
    @Published var averageScore = 0.0
    
    @Published var highestIncorrect = 0
    @Published var lowestIncorrect = 0
    @Published var averageIncorrect = 0.0
    
    let calculator = Calculator()
    
}


extension StatsDataManager {
    
    func updateArrayFilters(_ allLogs: [GameLog]) {
        
        let filteredByDuration: [GameLog]
        let filteredByGameFreq: [GameLog]
        let filteredByGameRange: [GameLog]
        
        let filteredByGameType = allLogs.filter { $0.gameType == gameType.rawValue }
        
        if gameDuration == .zero {
            filteredByDuration = filteredByGameType
        } else {
            filteredByDuration = filteredByGameType.filter { $0.duration == gameDuration.rawValue }
        }
        
        if gameFreq == 1 {
            filteredByGameFreq = filteredByDuration
        } else {
            filteredByGameFreq = filteredByDuration.filter { $0.numberFreq == Int64(gameFreq) }
        }
        
        if gameRange == 1 {
            filteredByGameRange = filteredByGameFreq
        } else {
            filteredByGameRange = filteredByGameFreq.filter { $0.numberRange == Int64(gameRange) }
        }
        
        filteredLogs = filteredByGameRange
    }
    
    func highScoreStats() {
        highestScore = Int(filteredLogs.sorted { $0.correctAnswers > $1.correctAnswers }.first?.correctAnswers ?? 0)
        lowestScore = Int(filteredLogs.sorted { $0.correctAnswers < $1.correctAnswers }.first?.correctAnswers ?? 0)
        let scoreArray = filteredLogs.map { Double($0.correctAnswers) }
        averageScore = calculator.mean(scoreArray)
    }
    
}


extension StatsDataManager {
    func incorrectStats() {
        highestIncorrect = Int(filteredLogs.sorted { $0.incorrectAnswers > $1.incorrectAnswers }.first?.incorrectAnswers ?? 0)
        lowestIncorrect = Int(filteredLogs.sorted { $0.incorrectAnswers < $1.incorrectAnswers }.first?.incorrectAnswers ?? 0)
        let scoreArray = filteredLogs.map { Double($0.incorrectAnswers) }
        averageIncorrect = calculator.mean(scoreArray)
    }
}
