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

extension GameLog {
    static func example() -> GameLog {
        let example = GameLog(context: CoreDataManager.preview.container.viewContext)
        example.id = UUID()
        example.date = .now
        example.notes = "that was super hard"
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 25
        example.duration = 60
        example.gameQuestionAttempts = "{\"4\":1,\"9\":1,\"10\":1,\"17\":1,\"20\":1,\"18\":1,\"5\":1,\"1\":1,\"11\":1,\"22\":1,\"16\":1,\"24\":2,\"15\":1,\"2\":1,\"23\":1,\"14\":1,\"3\":1,\"8\":1,\"7\":1,\"6\":1,\"19\":1,\"21\":1,\"12\":1,\"13\":1,\"25\":1}"
        example.gameQuestionDurations = "{\"4\":2,\"9\":2,\"10\":2,\"17\":2,\"20\":2,\"18\":4,\"5\":2,\"1\":2,\"11\":2,\"22\":2,\"16\":2,\"24\":7,\"26\":1,\"15\":2,\"2\":3,\"23\":2,\"14\":3,\"3\":2,\"8\":2,\"7\":2,\"6\":1,\"19\":2,\"21\":2,\"12\":2,\"13\":2,\"25\":3}"
        example.incorrectAnswers = 1
        example.questionsAsked = 26
        example.gameQuestions = "{\"4\":\"4 + 4\",\"9\":\"8 + 2\",\"10\":\"3 + 2\",\"17\":\"9 + 10\",\"20\":\"4 + 10\",\"18\":\"2 + 10\",\"5\":\"10 + 3\",\"1\":\"2 + 8\",\"11\":\"6 + 8\",\"22\":\"3 + 3\",\"26\":\"9 + 8\",\"24\":\"4 + 8\",\"16\":\"6 + 5\",\"15\":\"6 + 8\",\"2\":\"10 + 2\",\"23\":\"7 + 6\",\"14\":\"8 + 3\",\"3\":\"9 + 4\",\"8\":\"10 + 4\",\"7\":\"5 + 9\",\"6\":\"6 + 1\",\"19\":\"9 + 9\",\"21\":\"9 + 9\",\"12\":\"10 + 10\",\"13\":\"9 + 10\",\"25\":\"6 + 10\"}"
        example.gameAnswers = "{\"4\":8,\"9\":10,\"10\":5,\"17\":19,\"20\":14,\"18\":12,\"5\":13,\"1\":10,\"11\":14,\"26\":17,\"16\":11,\"24\":12,\"22\":6,\"15\":14,\"2\":12,\"23\":13,\"14\":11,\"3\":13,\"8\":14,\"7\":14,\"6\":7,\"19\":18,\"21\":18,\"12\":20,\"13\":19,\"25\":16}"
        return example
    }
}

extension GameLog {
    static func example1(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 3
        example.duration = 10
        example.gameQuestionAttempts = "{\"2\":2,\"3\":4,\"1\":2}"
        example.gameQuestionDurations = "{\"1\":2,\"3\":4,\"2\":2,\"4\":2}"
        example.incorrectAnswers = 5
        example.questionsAsked = 4
        example.gameQuestions = "{\"4\":\"7 + 6\",\"3\":\"6 + 8\",\"2\":\"10 + 10\",\"1\":\"5 + 4\"}"
        example.gameAnswers = "{\"4\":13,\"3\":14,\"2\":20,\"1\":9}"
        return example
    }
}

extension GameLog {
    static func example2(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.addingTimeInterval(-86400)
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 3
        example.duration = 10
        example.gameQuestionAttempts = "{\"3\":1,\"1\":2,\"2\":1}"
        example.gameQuestionDurations = "{\"3\":2,\"4\":1,\"2\":2,\"1\":5}"
        example.incorrectAnswers = 1
        example.questionsAsked = 4
        example.gameQuestions = "{\"3\":\"8 + 7\",\"4\":\"9 + 9\",\"2\":\"5 + 3\",\"1\":\"8 + 5\"}"
        example.gameAnswers = "{\"3\":15,\"2\":8,\"4\":18,\"1\":13}"
        return example
    }
}

extension GameLog {
    static func example3(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.addingTimeInterval(-86400*2)
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 4
        example.duration = 10
        example.gameQuestionAttempts = "{\"1\":1,\"2\":2,\"3\":1,\"4\":1}"
        example.gameQuestionDurations = "{\"1\":1,\"2\":5,\"3\":2,\"4\":1,\"5\":1}"
        example.incorrectAnswers = 1
        example.questionsAsked = 5
        example.gameQuestions = "{\"1\":\"9 + 1\",\"2\":\"3 + 8\",\"3\":\"1 + 1\",\"4\":\"1 + 4\",\"5\":\"7 + 5\"}"
        example.gameAnswers = "{\"1\":10,\"2\":11,\"3\":2,\"4\":5,\"5\":12}"
        return example
    }
}

extension GameLog {
    static func example4(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.addingTimeInterval(-86400*3)
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 5
        example.duration = 10
        example.gameQuestionAttempts = "{\"1\":1,\"5\":1,\"4\":1,\"2\":1,\"3\":1}"
        example.gameQuestionDurations = "{\"1\":2,\"5\":1,\"6\":1,\"4\":2,\"2\":2,\"3\":2}"
        example.incorrectAnswers = 0
        example.questionsAsked = 6
        example.gameQuestions = "{\"1\":\"6 + 6\",\"5\":\"2 + 9\",\"4\":\"7 + 3\",\"6\":\"7 + 9\",\"2\":\"1 + 10\",\"3\":\"3 + 5\"}"
        example.gameAnswers = "{\"1\":12,\"5\":11,\"6\":16,\"4\":10,\"2\":11,\"3\":8}"
        return example
    }
}

