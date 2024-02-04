//
//  QuestionLogData.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct QuestionLogData: Identifiable {
    let questionNumber: Int
    let question: String
    let answer: Double
    let attempts: Int
    let duration: Int
    var id: Int {questionNumber}
}

extension Array where Array == [QuestionLogData] {
    static let examples: [QuestionLogData] = GameLog.example().parseLogData().questionsLogData
}
