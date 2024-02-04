//
//  GameLogDataTable.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 02/02/2024.
//

import SwiftUI

struct GameLogDataTable: View {
    let parsedLogData: ParsedLogData
    var body: some View {
        Table(parsedLogData.questionsLogData) {
            TableColumn("Question Number") { log in
                Text(String(log.questionNumber))
            }
            TableColumn("Question", value: \.question)
            TableColumn("Attempts") { log in
                Text(String(log.attempts))
            }
            TableColumn("Duration") { log in
                Text(String(log.duration))
            }
        }
    }
}

#Preview {
    NavigationStack {
        GameLogDataTable(parsedLogData: .example)
    }
}
