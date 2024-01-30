//
//  TimerConfigView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct TimerConfigView: View {
    @Binding var timerLength: Double
    var body: some View {
        VStack {
            Text("\(TimerManager.lengthToSeconds(timerLength))")
            HStack {
                Spacer()
//                            Text("\(timerLength, specifier: "%.2f")")
                Stepper("", value: $timerLength, in: 0...3, step: 0.5) { _ in
//                    timerObject.setTime()
                }
                
//                .disabled(timerObject.isTimerStarted)
                    .labelsHidden()
                Spacer()
            }

            
        }
    }
}

#Preview {
    TimerConfigView(timerLength: .constant(5))
//    TimerConfigView(timerLength: .createBinding(5))
}
