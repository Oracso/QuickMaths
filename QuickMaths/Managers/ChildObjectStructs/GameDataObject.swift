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
    
    var gameQuestionAttempts: [Int : Int] = [:]
    var gameQuestionDurations: [Int : Int] = [:]
    
    var gameQuestions: [Int: String] = [:]
    var gameAnswers: [Int: Double] = [:]
    
}

