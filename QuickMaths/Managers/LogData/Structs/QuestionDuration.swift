//
//  QuestionDuration.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct QuestionDuration:  Identifiable, Hashable {
    let questionNumber: Int
    let questionDuration: Int
    var id: Int { questionNumber }
}
