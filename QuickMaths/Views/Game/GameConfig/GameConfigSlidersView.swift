//
//  GameConfigSlidersView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameConfigSlidersView: View {
    @ObservedObject var gameConfig: GameConfigObject
    var body: some View {
        VStack {
            Text("Number Frequency: \(String(format: "%.f", gameConfig.gameNumberFreq))")
            Slider(value: $gameConfig.gameNumberFreq, in: 2...10, step: 1)
            
            
            Text("Number Range: \(String(format: "%.f", gameConfig.gameNumberRange))")
            Slider(value: $gameConfig.gameNumberRange, in: 10...100, step: 5)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    GameConfigSlidersView(gameConfig: GameConfigObject())
}
