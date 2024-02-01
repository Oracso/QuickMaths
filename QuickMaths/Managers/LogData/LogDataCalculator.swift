//
//  LogDataCalculator.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct LogDataCalculator {
    
    func returnLogAttempts(_ gameQuestionAttempts: String) -> [QuestionAttempts] {
        let dic = JSONManager.jsonStringToDictionary(jsonString: gameQuestionAttempts)
        var array = [QuestionAttempts]()
        for item in dic.sorted(by: <) {
            let newItem = QuestionAttempts(questionNumber: item.key, questionTries: item.value)
            array.append(newItem)
        }
        return array
    }
    
    
    
    func returnLogDurations(_ gameQuestionDurations: String) -> [QuestionDuration] {
        let dic = JSONManager.jsonStringToDictionary(jsonString: gameQuestionDurations)
        var loadedDurations = [QuestionDuration]()
        for item in dic.sorted(by: <) {
            let newItem = QuestionDuration(questionNumber: item.value, questionDuration: item.key)
            loadedDurations.append(newItem)
        }
        
        
        let questions = loadedDurations.map { $0.questionNumber }
        
        var finalDic = [Int : Int]()
        
        for number in questions {
            let filtered = loadedDurations.filter { $0.questionNumber == number}
            let timeForQuestion = filtered.count
            
            finalDic[number] = timeForQuestion
            
        }
        
        
        var array = [QuestionDuration]()
        for item in finalDic.sorted(by: <) {
            let newItem = QuestionDuration(questionNumber: item.key, questionDuration: item.value)
            array.append(newItem)
        }
        return array
        
    }
    
}
