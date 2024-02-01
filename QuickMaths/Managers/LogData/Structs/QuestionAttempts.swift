//
//  QuestionAttempts.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct QuestionAttempts: Identifiable, Hashable {
    let questionNumber: Int
    let questionTries: Int
    var id: Int { questionNumber }
}
