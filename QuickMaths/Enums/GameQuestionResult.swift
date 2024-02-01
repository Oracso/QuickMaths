//
//  GameQuestionResult.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

enum GameQuestionResult {
    case correct
    case incorrect
    case setup
}

extension GameQuestionResult {
    func displayText() -> String {
        switch self {
        case .correct:
            return "You got it"
        case .incorrect:
            return "You messed up, try again"
        case .setup:
            return "Are you ready to play"
        }
    }
}

