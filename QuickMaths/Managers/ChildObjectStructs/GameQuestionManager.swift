//
//  GameQuestionManager.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

struct GameQuestionManager {
    
    var question: String = " "
    
    var inputText: String = " "
    
    var answer: Int?
    var realAnswer: Int = 0
    
//    var result: String = "Are you ready?"
    var result: GameQuestionResult = .setup
    
}

