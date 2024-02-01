//
//  GameCountdownView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct GameCountdownView: View {
    @Binding var timerProgress: Double
    @Binding var secondsRemaining: Int
    var body: some View {
        HStack {
            ProgressBar(timerProgress: $timerProgress)
            CountdownTimer(secondsRemaining: $secondsRemaining)
        }
        .padding(.horizontal)
    }
}

#Preview {
    GameCountdownView(timerProgress: .constant(0.5), secondsRemaining: .constant(30))
}
