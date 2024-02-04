//
//  ParsedLogData.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct ParsedLogData: Identifiable {
    let date: Date
    var id: Date { date }
    
    let questionsLogData: [QuestionLogData]
}


extension ParsedLogData {
    static let example = GameLog.example().parseLogData()
}

extension ParsedLogData {
    
    func logQuestions() -> [Int: String]{
        return Dictionary(uniqueKeysWithValues: questionsLogData.map({ ($0.questionNumber, $0.question) }))
    }
    
    func logAnswers() -> [Int: Double]{
        return Dictionary(uniqueKeysWithValues: questionsLogData.map({ ($0.questionNumber, $0.answer) }))
    }
    
    func logAttempts() -> [Int: Int]{
        return Dictionary(uniqueKeysWithValues: questionsLogData.map({ ($0.questionNumber, $0.attempts) }))
    }
    
    func logDurations() -> [Int: Int ]{
        return Dictionary(uniqueKeysWithValues: questionsLogData.map({ ($0.questionNumber, $0.duration) }))
    }
    
}

