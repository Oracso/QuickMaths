//
//  ParsedLogData.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct ParsedLogData: Identifiable {
    let date: Date
    var id: Date { date }
    
    var logAttempts: [QuestionAttempts]
    var logDurations: [QuestionDuration]
    
}
