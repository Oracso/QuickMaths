//
//  GameConfigSlidersView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameConfigSlidersView: View {
    
    init(_ numberFreq: Binding<Double>, _ numberRange: Binding<Double>) {
        self._numberFreq = numberFreq
        self._numberRange = numberRange
    }
    
    @Binding var numberFreq: Double
    @Binding var numberRange: Double
    
    var body: some View {
        VStack {
            Text("Number Frequency: \(String(format: "%.f", numberFreq))")
            Slider(value: $numberFreq, in: 2...10, step: 1)

            Text("Number Range: \(String(format: "%.f", numberRange))")
            Slider(value: $numberRange, in: 10...100, step: 5)
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    GameConfigSlidersView(.createBinding(2), .createBinding(10))
}
