//
//  GameType.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

enum GameType: String, Codable, CaseIterable, Identifiable {
    case addition
    case subtraction
    case multiplication
    case division
    case whichSign
    var id: GameType { self }
}

extension GameType {
    func gameSymbol() -> String {
        switch self {
        case .addition:
            "+"
        case .subtraction:
            "-"
        case .multiplication:
            "x"
        case .division:
            "÷"
        case .whichSign:
            "?"
        }
    }
}
