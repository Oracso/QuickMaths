//
//  GameLogExtensions.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation



extension GameLog {
    
    
    
    public var formattedDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .medium, timeStyle: .medium)
    }
    

    
    
}
    

extension GameLog {
    static func example() -> GameLog {
        let example = GameLog()
        example.id = UUID()
        example.date = .distantPast
        example.notes = "that was super hard"
        example.gameType = "addition"
        return example
    }
}




extension GameLog {
    
    
    func gameSymbol() -> String {
        let gameType = GameType(rawValue: gameType ?? "")
        if let gameType {
            return gameType.gameSymbol()
        } else {
            return ""
        }
    }
    
}


// TODO: Use unwrapped properties here
extension GameLog {
    
    func logAttempts() -> [QuestionAttempts] {
        LogDataCalculator().returnLogAttempts(gameQuestionAttempts ?? "")
    }
    
    func logDurations() -> [QuestionDuration] {
        LogDataCalculator().returnLogDurations(gameQuestionDurations ?? "")
    }
    
}
