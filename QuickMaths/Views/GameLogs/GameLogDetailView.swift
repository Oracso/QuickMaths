//
//  GameLogDetailView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct GameLogDetailView: View {
    
    init(_ log: GameLog) {
        self.log = log
    }
    
    @ObservedObject var log: GameLog
    
    var parsedLogData: ParsedLogData {
        log.parseLogData()
    }
    
    @State private var isSectionExpanded = true
    
    var body: some View {
        
        List {
            
            Section("Results:") {
                Text("Correct Answers: \(log.correctAnswers)")
                Text("Questions Asked: \(log.questionsAsked)")
                Text("Incorrect Answers: \(log.incorrectAnswers)")
            }
            
            Section("Game Info:") {
                Text("Game Duration: \(log.duration) seconds")
                Text("Game Type: \(log.unwrappedGameType.capitalized)")
                Text("Different Numbers: \(log.numberFreq)")
                Text("Number Range: 1 - \(log.numberRange)")
                
                if let notes = log.notes {
                    DisclosureGroup("Notes") {
                        Text(notes)
                    }
                }
            }
            
            GameLogDataView(parsedLogData: log.parseLogData())
            
        }
        
        .listStyle(SidebarListStyle())
        
        .navigationTitle(log.formattedDate)
        
    }
}


#Preview {
    NavigationStack {
        GameLogDetailView(.example())
    }
}
