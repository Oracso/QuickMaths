//
//  GameLogExamples.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData

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
        example.date = .now.daysDif(1)
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
        example.date = .now.daysDif(2)
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
        example.date = .now.daysDif(3)
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
        example.date = .now.daysDif(4)
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

extension GameLog {
    static func example5(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.daysDif(5)
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 9
        example.duration = 30
        example.gameQuestionAttempts = "{\"5\":1,\"6\":1,\"2\":2,\"3\":1,\"1\":2,\"7\":1,\"4\":1,\"9\":2,\"8\":2}"
        example.gameQuestionDurations = "{\"10\":2,\"6\":2,\"5\":2,\"2\":4,\"3\":3,\"1\":5,\"7\":2,\"4\":3,\"9\":3,\"8\":4}"
        example.incorrectAnswers = 4
        example.questionsAsked = 10
        example.gameQuestions = "{\"5\":\"10 + 4\",\"6\":\"9 + 9\",\"10\":\"9 + 10\",\"2\":\"9 + 4\",\"3\":\"6 + 10\",\"1\":\"6 + 7\",\"7\":\"6 + 3\",\"9\":\"1 + 9\",\"4\":\"6 + 7\",\"8\":\"5 + 10\"}"
        example.gameAnswers = "{\"5\":14,\"6\":18,\"10\":19,\"2\":13,\"3\":16,\"1\":13,\"7\":9,\"9\":10,\"4\":13,\"8\":15}"
        return example
    }
}

extension GameLog {
    static func example6(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.daysDif(6)
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 3
        example.numberRange = 10
        example.correctAnswers = 9
        example.duration = 30
        example.gameQuestionAttempts = "{\"1\":1,\"7\":2,\"6\":1,\"9\":1,\"8\":1,\"5\":2,\"2\":2,\"3\":1,\"4\":1}"
        example.gameQuestionDurations = "{\"1\":2,\"6\":2,\"7\":4,\"9\":2,\"5\":4,\"10\":3,\"8\":2,\"2\":4,\"3\":4,\"4\":3}"
        example.incorrectAnswers = 3
        example.questionsAsked = 10
        example.gameQuestions = "{\"1\":\"9 + 3 + 4\",\"7\":\"3 + 7 + 9\",\"6\":\"2 + 4 + 6\",\"9\":\"10 + 1 + 8\",\"8\":\"4 + 3 + 3\",\"10\":\"3 + 2 + 1\",\"5\":\"7 + 2 + 2\",\"2\":\"5 + 3 + 8\",\"4\":\"2 + 6 + 8\",\"3\":\"1 + 8 + 5\"}"
        example.gameAnswers = "{\"1\":16,\"6\":12,\"7\":19,\"9\":19,\"5\":11,\"10\":6,\"8\":10,\"2\":16,\"4\":16,\"3\":14}"
        return example
    }
}

extension GameLog {
    static func example7(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.daysDif(7)
        example.notes = nil
        example.gameType = "addition"
        example.numberFreq = 2
        example.numberRange = 15
        example.correctAnswers = 11
        example.duration = 30
        example.gameQuestionAttempts = "{\"4\":1,\"2\":1,\"7\":1,\"8\":1,\"11\":2,\"1\":1,\"6\":1,\"5\":3,\"10\":1,\"3\":1,\"9\":1}"
        example.gameQuestionDurations = "{\"12\":3,\"4\":3,\"8\":2,\"7\":3,\"2\":3,\"11\":3,\"6\":1,\"1\":3,\"10\":2,\"5\":4,\"3\":1,\"9\":2}"
        example.incorrectAnswers = 3
        example.questionsAsked = 12
        example.gameQuestions = "{\"12\":\"6 + 10\",\"4\":\"5 + 8\",\"2\":\"8 + 12\",\"7\":\"11 + 12\",\"8\":\"2 + 5\",\"11\":\"3 + 7\",\"1\":\"14 + 2\",\"6\":\"1 + 1\",\"10\":\"10 + 5\",\"5\":\"6 + 8\",\"3\":\"8 + 10\",\"9\":\"14 + 1\"}"
        example.gameAnswers = "{\"12\":16,\"4\":13,\"8\":7,\"7\":23,\"2\":20,\"11\":10,\"1\":16,\"6\":2,\"5\":14,\"10\":15,\"3\":18,\"9\":15}"
        return example
    }
}

extension GameLog {
    static func example8(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.daysDif(8)
        example.notes = nil
        example.gameType = "subtraction"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 3
        example.duration = 30
        example.gameQuestionAttempts = "{\"7\":2,\"4\":1,\"10\":1,\"9\":2,\"6\":2,\"1\":1,\"3\":1,\"8\":1,\"5\":1,\"2\":1}"
        example.gameQuestionDurations = "{\"8\":1,\"5\":3,\"10\":2,\"9\":2,\"11\":2,\"6\":4,\"1\":2,\"3\":2,\"4\":3,\"7\":5,\"2\":4}"
        example.incorrectAnswers = 3
        example.questionsAsked = 11
        example.gameQuestions = "{\"7\":\"9 - 9\",\"8\":\"8 - 3\",\"10\":\"6 - 3\",\"11\":\"10 - 2\",\"9\":\"7 - 7\",\"6\":\"3 - 10\",\"1\":\"5 - 5\",\"3\":\"2 - 2\",\"4\":\"5 - 10\",\"5\":\"4 - 6\",\"2\":\"8 - 10\"}"
        example.gameAnswers = "{\"7\":0,\"8\":5,\"11\":8,\"9\":0,\"3\":0,\"6\":-7,\"1\":0,\"10\":3,\"4\":-5,\"5\":-2,\"2\":-2}"
        return example
    }
}

extension GameLog {
    static func example9(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.daysDif(9)
        example.notes = nil
        example.gameType = "subtraction"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 10
        example.duration = 30
        example.gameQuestionAttempts = "{\"3\":2,\"2\":1,\"5\":1,\"7\":1,\"8\":1,\"9\":1,\"1\":2,\"4\":1,\"10\":1,\"6\":1}"
        example.gameQuestionDurations = "{\"3\":2,\"2\":3,\"5\":2,\"7\":2,\"9\":3,\"8\":2,\"11\":3,\"1\":4,\"10\":4,\"4\":3,\"6\":2}"
        example.incorrectAnswers = 2
        example.questionsAsked = 11
        example.gameQuestions = "{\"3\":\"6 - 5\",\"2\":\"6 - 1\",\"5\":\"6 - 2\",\"7\":\"9 - 10\",\"8\":\"9 - 10\",\"11\":\"2 - 9\",\"9\":\"7 - 10\",\"10\":\"7 - 9\",\"4\":\"9 - 10\",\"1\":\"8 - 9\",\"6\":\"1 - 2\"}"
        example.gameAnswers = "{\"3\":1,\"2\":5,\"5\":4,\"7\":-1,\"8\":-1,\"9\":-3,\"11\":-7,\"10\":-2,\"1\":-1,\"4\":-1,\"6\":-1}"
        return example
    }
}

extension GameLog {
    static func example10(_ context: NSManagedObjectContext) -> GameLog {
        let example = GameLog(context: context)
        example.id = UUID()
        example.date = .now.daysDif(10)
        example.notes = nil
        example.gameType = "multiplication"
        example.numberFreq = 2
        example.numberRange = 10
        example.correctAnswers = 13
        example.duration = 30
        example.gameQuestionAttempts = "{\"6\":1,\"13\":1,\"10\":1,\"11\":1,\"9\":1,\"2\":1,\"3\":1,\"12\":1,\"1\":1,\"5\":1,\"8\":2,\"7\":1,\"4\":1}"
        example.gameQuestionDurations = "{\"6\":2,\"11\":3,\"10\":2,\"13\":2,\"9\":2,\"2\":2,\"14\":1,\"3\":2,\"12\":2,\"1\":2,\"5\":2,\"8\":3,\"7\":2,\"4\":3}"
        example.incorrectAnswers = 1
        example.questionsAsked = 14
        example.gameQuestions = "{\"6\":\"10 x 4\",\"13\":\"5 x 3\",\"10\":\"5 x 3\",\"11\":\"10 x 6\",\"9\":\"9 x 1\",\"2\":\"3 x 4\",\"14\":\"6 x 9\",\"3\":\"3 x 9\",\"12\":\"8 x 3\",\"1\":\"2 x 6\",\"5\":\"1 x 3\",\"8\":\"8 x 1\",\"7\":\"6 x 9\",\"4\":\"3 x 9\"}"
        example.gameAnswers = "{\"6\":40,\"13\":15,\"10\":15,\"11\":60,\"9\":9,\"2\":12,\"3\":27,\"14\":54,\"12\":24,\"1\":12,\"5\":3,\"8\":8,\"7\":54,\"4\":27}"
        return example
    }
}


