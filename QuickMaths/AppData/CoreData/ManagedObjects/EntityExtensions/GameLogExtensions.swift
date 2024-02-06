//
//  GameLogExtensions.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData


extension GameLog {

    public var formattedDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .medium, timeStyle: .short)
    }
    
    public var chartDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .short, timeStyle: .short)
    }
    
    public var listDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .short, timeStyle: .none)
    }
    
    public var unwrappedGameType: String {
        gameType ?? "nil"
    }
    
}

// MARK: - ObjectStore FetchRequest

extension GameLog {
    public class func objectStoreFetchRequest() -> NSFetchRequest<GameLog> {
        let request = NSFetchRequest<GameLog>(entityName: "GameLog")
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        return request
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

extension GameLog {
    func parseLogData() -> ParsedLogData {
        let ldf = LogDataFormatter()
        
        let questions = ldf.returnLogQuestions(gameQuestions ?? "")
        let answers = ldf.returnLogAnswers(gameAnswers ?? "")
        let attempts = ldf.returnLogAttempts(gameQuestionAttempts ?? "")
        let durations = ldf.returnLogDurations(gameQuestionDurations ?? "")
        
        var questionsLogData: [QuestionLogData] = []
        
        for question in questions {
            let index = question.key
            let question: String = questions[index] ?? "Fuck"
            let answer: Double = answers[index] ?? -666.666
            let attempts: Int = attempts[index] ?? 0
            let duration: Int = durations[index] ?? -666
            
            let questionLogData = QuestionLogData(questionNumber: index, question: question, answer: answer, attempts: attempts, duration: duration)
            questionsLogData.append(questionLogData)
        }
        
        questionsLogData.sort(by: {$0.questionNumber < $1.questionNumber})
        
        // TODO: FORCE UNWRAP
        return ParsedLogData(date: date ?? .now, questionsLogData: questionsLogData)
        
    }
}

