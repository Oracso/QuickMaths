//
//  GameLog+CoreDataClass.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//
//

import Foundation
import CoreData

@objc(GameLog)
public class GameLog: NSManagedObject {

    
    // MARK: - Coding Keys

    private enum CodingKeys : String, CodingKey {
        case id, correctAnswers, date, duration, gameAnswers, gameQuestionAttempts, gameQuestionDurations, gameQuestions, gameType, incorrectAnswers, notes, numberFreq, numberRange, questionsAsked
    }

    // MARK: - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(correctAnswers, forKey: .correctAnswers)
        try container.encode(date, forKey: .date)
        try container.encode(duration, forKey: .duration)
        try container.encode(gameAnswers, forKey: .gameAnswers)
        try container.encode(gameQuestionAttempts, forKey: .gameQuestionAttempts)
        try container.encode(gameQuestionDurations, forKey: .gameQuestionDurations)
        try container.encode(gameQuestions, forKey: .gameQuestions)
        try container.encode(gameType, forKey: .gameType)
        try container.encode(incorrectAnswers, forKey: .incorrectAnswers)
        try container.encode(notes, forKey: .notes)
        try container.encode(numberFreq, forKey: .numberFreq)
        try container.encode(numberRange, forKey: .numberRange)
        try container.encode(questionsAsked, forKey: .questionsAsked)
    }

    // MARK: - Decodable

    public required convenience init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "GameLog", in: managedObjectContext) else {  fatalError("Failed to decode GameLog!")  }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        correctAnswers = try container.decode(Int64.self, forKey: .correctAnswers)
        date = try container.decode(Date.self, forKey: .date)
        duration = try container.decode(Int64.self, forKey: .duration)
        gameAnswers = try container.decode(String.self, forKey: .gameAnswers)
        gameQuestionAttempts = try container.decode(String.self, forKey: .gameQuestionAttempts)
        gameQuestionDurations = try container.decode(String.self, forKey: .gameQuestionDurations)
        gameQuestions = try container.decode(String.self, forKey: .gameQuestions)
        gameType = try container.decode(String.self, forKey: .gameType)
        incorrectAnswers = try container.decode(Int64.self, forKey: .incorrectAnswers)
        notes = try container.decode(String.self, forKey: .notes)
        numberFreq = try container.decode(Int64.self, forKey: .numberFreq)
        numberRange = try container.decode(Int64.self, forKey: .numberRange)
        questionsAsked = try container.decode(Int64.self, forKey: .questionsAsked)
    }
    
}

extension GameLog: Codable { }
