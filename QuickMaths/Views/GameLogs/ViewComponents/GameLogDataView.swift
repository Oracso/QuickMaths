//
//  GameLogDataView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import SwiftUI

struct GameLogDataView: View {
    let parsedLogData: ParsedLogData
    @State private var isExpanded = true
    var body: some View {
        Section("Game Log Data:", isExpanded: $isExpanded) {
            ForEach(parsedLogData.questionsLogData) { questionData in
                HStack {
                    Text("\(questionData.questionNumber))")
                    Text("\"\(questionData.question) = \(questionData.answer.roundToIntOrDouble())\"")
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Text("Attempts: \(questionData.attempts)")
                        Text("(\(questionData.duration)s)")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            GameLogDataView(parsedLogData: .example)
        }
    }
}
