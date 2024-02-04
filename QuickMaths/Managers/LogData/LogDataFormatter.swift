//
//  LogDataFormatter.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct LogDataFormatter {
    
    func returnLogQuestions(_ gameQuestions: String) -> [Int : String] {
        let dic = JSONManager.jsonStringToDictionary(gameQuestions, Int.self, String.self)
        return dic
    }
    
    func returnLogAnswers(_ gameAnswers: String) -> [Int : Double] {
        let dic = JSONManager.jsonStringToDictionary(gameAnswers, Int.self, Double.self)
        return dic
    }
    
    func returnLogAttempts(_ gameQuestionAttempts: String) -> [Int : Int] {
        let dic = JSONManager.jsonStringToDictionary(gameQuestionAttempts, Int.self, Int.self)
        return dic
    }
    
    func returnLogDurations(_ gameQuestionDurations: String) -> [Int : Int] {
        let dic = JSONManager.jsonStringToDictionary(gameQuestionDurations, Int.self, Int.self)
        return dic
    }
    
}
