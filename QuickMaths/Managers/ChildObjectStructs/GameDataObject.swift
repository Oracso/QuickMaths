//
//  GameDataObject.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

struct GameDataObject {
    
    var questionAttempts = 0
    var questionNumber = 0
    
    var correctAnswers = 0
    var incorrectAnswers = 0
    
    var roundQuestionAttempts: [Int : Int] = [:]
    var roundQuestionDuration: [Int : Int] = [:]
    
    var roundDuration = 0
    
}

// TODO: I don't think this is needed as object will be refreshed
//extension GameDataObject {
//    func resetObject() {
//        questionTries = 0
//        questionNumber = 0
//        correctAnswers = 0
//        incorrectAnswers = 0
//        roundQuestionAttempts = [:]
//        roundQuestionDuration = [:]
//        roundDuration = 0
//    }
//}




extension GameDataObject {
    func dictionaryToJsonString(dictionary: [Int:Int]) -> String {
        do {
            let jsonData = try JSONEncoder().encode(dictionary)
            return String(data: jsonData, encoding: .utf8)!
        } catch {
            print(error.localizedDescription)
            return ""
        }
    }
}
