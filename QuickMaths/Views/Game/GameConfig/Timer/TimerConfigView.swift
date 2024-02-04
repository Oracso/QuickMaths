//
//  TimerConfigView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct TimerConfigView: View {
    @Binding var timerLength: TimerLength
    @State private var stepperValue: Double = 0
    var body: some View {
        VStack {
            Text("\(timerLength.rawValue)s")
                .font(.system(size: 24))
            HStack {
                Spacer()
                Stepper("", value: $stepperValue, in: 0...3, step: 0.5) { _ in }
                    .onChange(of: stepperValue, { oldValue, newValue in
                        timerLength = TimerLength(rawValue: Int(stepperValue * 60)) ?? .zero
                    })
                    .labelsHidden()
                Spacer()
            }
            .onAppear() {
                stepperValue = Double(timerLength.rawValue / 60)
            }
        }
    }
}

#Preview {
    TimerConfigView(timerLength: .createBinding(.sixty))
}
