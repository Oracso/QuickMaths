//
//  GameType.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

enum GameType: String, Codable, CaseIterable, Identifiable {
    case addition
//    case timedAddition = "timed addition"
//    case timedSubtraction = "timed subtraction"
//    case timedMultiplication = "timed multiplication"
//    case timedDivision = "timed division"
//    case whichSign = "which sign"
    var id: GameType { self }
}


// This is here to keep enum raw value shorter - This is customer facing
extension GameType {
    var gameName: String {
        switch self {
        case .addition:
            "Addition"
        }
    }
}
