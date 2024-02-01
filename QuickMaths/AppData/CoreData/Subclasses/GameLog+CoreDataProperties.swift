//
//  GameLog+CoreDataProperties.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//
//

import Foundation
import CoreData


extension GameLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameLog> {
        return NSFetchRequest<GameLog>(entityName: "GameLog")
    }

    @NSManaged public var correctAnswers: Int64
    @NSManaged public var date: Date?
    @NSManaged public var duration: Int64
    @NSManaged public var gameQuestionAttempts: String?
    @NSManaged public var gameQuestionDurations: String?
    @NSManaged public var gameType: String?
    @NSManaged public var id: UUID?
    @NSManaged public var incorrectAnswers: Int64
    @NSManaged public var notes: String?
    @NSManaged public var numberFreq: Int64
    @NSManaged public var numberRange: Int64
    @NSManaged public var questionsAsked: Int64

}

//extension GameLog : Identifiable {
//
//}

