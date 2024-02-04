//
//  CoreDataModifier.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData

struct CoreDataModifier {

    let context: NSManagedObjectContext
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    func createGameLog(date: Date, duration: Int, gameType: GameType, numberFreq: Double, numberRange: Double, questionsAsked: Int, correctAnswers: Int, incorrectAnswers: Int, gameQuestionAttempts: [Int: Int], gameQuestionDurations: [Int: Int], gameQuestions: [Int : String], gameAnswers: [Int: Double], notes: String? = nil) -> GameLog {
        let gameLog = GameLog(context: context)
        gameLog.id = UUID()
        
        gameLog.date = date
        gameLog.duration = Int64(duration)
        
        gameLog.gameType = gameType.rawValue
        
        gameLog.numberFreq = Int64(numberFreq)
        gameLog.numberRange = Int64(numberRange)
        
        gameLog.questionsAsked = Int64(questionsAsked)
        
        gameLog.correctAnswers = Int64(correctAnswers)
        gameLog.incorrectAnswers = Int64(incorrectAnswers)
        
        gameLog.gameQuestionAttempts = JSONManager.dictionaryToJsonString(gameQuestionAttempts)
        gameLog.gameQuestionDurations = JSONManager.dictionaryToJsonString(gameQuestionDurations)
        
        gameLog.gameQuestions = JSONManager.dictionaryToJsonString(gameQuestions)
        gameLog.gameAnswers = JSONManager.dictionaryToJsonString(gameAnswers)
        
        return gameLog
    }
    
}

