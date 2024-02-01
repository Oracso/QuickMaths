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
    
//    @EnvironmentObject var vem: ViewEditingManager
    
    
    var body: some View {
        
        
        List {

            Section("Results:") {
                Text("Correct Answers: \(log.correctAnswers)")
                Text("Questions Asked: \(log.questionsAsked)")
                //                Text("Accuracy: \(percentage)%")
                Text("Incorrect Answers: \(log.incorrectAnswers)")
            }

            Section("Game Info:") {
                Text("Game Duration: \(log.duration) seconds")
                // TODO: FORCE UNWRAP --- Need to use unwrapped extension
                Text("Game Type: \(log.gameType!)")
                Text("Different Numbers: \(log.numberFreq)")
                Text("Number Range: 1 - \(log.numberRange)")
                
                if let notes = log.notes {
                    DisclosureGroup("Notes") {
                        Text(notes)
                    }
                }
            }
            
            Section("Attempts:") {
                DisclosureGroup("Question Attempts") {
                    ForEach(log.logAttempts()) { item in
                        HStack {
                            Text("Question \(item.questionNumber):")
                            Spacer()
                            Text("\(item.questionTries) Attempts")
                                .padding(.horizontal, 20)
                        }
                        
                    }
                }
            }
            
            Section("Durations:") {
                DisclosureGroup("Question Durations") {
                    ForEach(log.logDurations()) { item in
                        HStack {
                            Text("Question \(item.questionNumber):")
                            Spacer()
                            Text("\(item.questionDuration) Seconds")
                                .padding(.horizontal, 20)
                        }
                        
                    }
                }
            }
            
            
            
            
                

            
        }
        
        .navigationTitle(log.formattedDate)

        
    }
}


#Preview {
    NavigationStack {
        GameLogDetailView(.example())
//            .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
    }
}
