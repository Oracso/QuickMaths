//
//  GameConfigObject.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

class GameConfigObject: ObservableObject {
    
    @Published var gameNumberFreq = 2.0
    @Published var gameNumberRange = 10.0
    
    @Published var timerLength = 0.0
    
    func resetConfig() {
        gameNumberFreq = 2.0
        gameNumberRange = 10.0
    }
    
}

