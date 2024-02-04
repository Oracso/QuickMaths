//
//  GameLogExtensions.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData


extension GameLog {
    
    public var unwrappedID: UUID {
        id ?? UUID()
    }

    // public var unwrappedName: String {
    //     name ?? "name found nil"
    // }
    

    // public var unwrappedDate: Date {
    //     date ?? .now
    // }

    public var unwrapped<#property#>: <#Type#> {
        <#property#> ?? <#example#>
    }
    
    // public var <#attribute#>Array: [<#Entity#>] {
    //      <#attribute#>.unwrap(<#Entity#>.self)
    // }
        
    
}


// MARK: - ObjectStore FetchRequest

extension GameLog {
    
    public class func objectStoreFetchRequest() -> NSFetchRequest<GameLog> {
        let request = NSFetchRequest<GameLog>(entityName: "GameLog")
            request.sortDescriptors = [NSSortDescriptor(key: "<#property#>", ascending: true)]
        
        return request
    }
    
    
    
    
    
}



// MARK: - Coding Keys

private enum CodingKeys : String, CodingKey {
    case id, name, <#property#>, XXX
}


// MARK: - Encodable

public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)

    // try container.encode(<#property#>, forKey: .<#property#>)
    
    // try container.encode(XXXArray.map({$0.id}), forKey: .XXX)
}


// MARK: - Decodable


public required convenience init(from decoder: Decoder) throws {
    
    
    guard let contextUserInfoKey = CodingUserInfoKey.context,
          let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
          let entity = NSEntityDescription.entity(forEntityName: "GameLog", in: managedObjectContext) else {  fatalError("Failed to decode GameLog!")  }
    
    self.init(entity: entity, insertInto: managedObjectContext)
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)

    // <#property#> = try container.decode(<#Type#>.self, forKey: .<#property#>)
    
    // let XXXArray = try container.decode([XXX].self, forKey: .XXX)
    // self.XXX = Set(XXXArray) as NSSet
    
    
    
}


extension GameLog: Codable { }





// MARK: - RelationalEntity Conformance

extension GameLog: RelationalEntity {
    
    typealias EntityRelationships = Relationships
 
    enum Relationships: String, CaseIterable {
        case XXX
    }
    
    func returnRelationship(_ relationship: Relationships) -> ObjectOrNSSet {
        switch relationship {
        // case .XXX:
        //     return ObjectOrNSSet(object: XXX)
        }
    }
    
    func returnRelationshipEntityType(_ relationship: Relationships) -> EntityType {
        switch relationship {
        // case .XXX:
        //     return .XXX
        }
    }
    
    func inverseRelationshipName(_ relationship: Relationships) -> String {
        switch relationship {
        // case .XXX:
        //     return "gameLog"
        }
    }
    
}


// MARK: - ObjectPlaceholderCompatible Conformance

extension GameLog: ObjectPlaceholderCompatible {
    
    var placeholderObjectName: String { unwrapped<#property#> }
    
    var placeholderEntityType: EntityType { .<#entityType#> }
    
}

// MARK: - RelationalPlaceholderObject Conformance

extension GameLog: RelationalPlaceholderObject {
    
}


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
    
    public var chartDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .short, timeStyle: .none)
    }
    
    
    
}


extension GameLog {
    static func example() -> GameLog {
        let example = GameLog()
        example.id = UUID()
        example.date = .distantPast
        example.notes = "that was super hard"
        example.gameType = "addition"
        
        example.numberFreq = 2
        example.numberRange = 10
        
        example.correctAnswers = 17
        example.duration = 60
        example.gameQuestionAttempts = "{\"11\":1,\"9\":1,\"14\":1,\"4\":1,\"15\":1,\"5\":1,\"16\":1,\"3\":1,\"10\":1,\"12\":5,\"17\":1,\"1\":1,\"7\":1,\"8\":1,\"2\":1,\"6\":1,\"13\":6}"
        example.gameQuestionDurations = "{\"35\":12,\"58\":18,\"31\":12,\"36\":12,\"10\":4,\"15\":6,\"16\":6,\"54\":16,\"17\":7,\"28\":12,\"33\":12,\"18\":7,\"20\":8,\"23\":10,\"47\":14,\"57\":17,\"42\":13,\"32\":12,\"9\":3,\"49\":15,\"52\":16,\"25\":11,\"39\":13,\"14\":5,\"43\":13,\"30\":12,\"60\":18,\"53\":16,\"1\":1,\"44\":13,\"48\":14,\"27\":12,\"56\":17,\"34\":12,\"3\":1,\"46\":13,\"6\":2,\"8\":3,\"2\":1,\"7\":2,\"59\":18,\"11\":4,\"12\":5,\"24\":10,\"40\":13,\"38\":13,\"29\":12,\"51\":16,\"41\":13,\"45\":13,\"26\":11,\"4\":1,\"21\":9,\"50\":15,\"13\":5,\"55\":17,\"19\":8,\"22\":9,\"5\":1,\"37\":12}"
        example.incorrectAnswers = 9
        example.questionsAsked = 18
        example.gameQuestions = "{\"11\":\"8 + 5\",\"9\":\"6 + 6\",\"14\":\"4 + 6\",\"4\":\"9 + 3\",\"15\":\"1 + 4\",\"5\":\"9 + 5\",\"16\":\"7 + 8\",\"3\":\"3 + 5\",\"10\":\"1 + 7\",\"12\":\"10 + 6\",\"17\":\"8 + 8\",\"1\":\"8 + 9\",\"7\":\"7 + 1\",\"8\":\"4 + 1\",\"2\":\"10 + 5\",\"18\":\"8 + 6\",\"13\":\"6 + 7\",\"6\":\"5 + 4\"}"
        
        example.gameAnswers = ""
        
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


//class GameLog: ObservableObject, Identifiable {
//
//    var correctAnswers: Int64 = 0
//    var date: Date?
//    var duration: Int64 = 0
//    var gameQuestionAttempts: String?
//    var gameQuestionDurations: String?
//    var gameType: String?
//    var id: UUID?
//    var incorrectAnswers: Int64 = 0
//    var notes: String?
//    var numberFreq: Int64 = 0
//    var numberRange: Int64 = 0
//    var questionsAsked: Int64 = 0
//
//    var gameQuestions: String?
//    var gameAnswers: String?
//}
