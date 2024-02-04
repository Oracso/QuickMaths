//
//  GameResultsView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import SwiftUI

struct GameResultsView: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var ads: AppDataStore
    @ObservedObject var gameManager: GameManager
    
    @State private var notes: String = ""
    @State private var addNotes = false
    
    func saveGame() {
        if gameManager.saveGame {
            if let gameLog = gameManager.gameLog {
                if addNotes == true {
                    gameLog.notes = notes
                }
                moc.saveIfChanges()
                ads.refresh()
            }
        }
    }
    
    var body: some View {
        VStack {
            
            Text("Score: \(gameManager.dataObject.correctAnswers)")
                .font(.system(size: 34))
            
            if let gameLog = gameManager.gameLog {
                NavigationLink {
                    GameLogDetailView(gameLog)
                } label: {
                    Text("See Game Details")
                }
            }
            
            HStack {
                Text("Save Game?")
                SaveGameToggle(saveGame: $gameManager.saveGame)
            }
            
            HStack {
                Spacer()
                Button {
                    saveGame()
                    gameManager.stopGame()
                } label: {
                    GameButton(text: "Home", count: 4)
                }
                Spacer()
                Button {
                    saveGame()
                    gameManager.restartGame()
                } label: {
                    GameButton(text: "Restart", count: 4)
                }
                Spacer()
            }
            .padding(.vertical)
            
            
            VStack {
                Button(addNotes ? "Remove Notes" : "Add Notes") {
                    addNotes.toggle()
                }
                if addNotes {
                    TextField("", text: $notes, prompt: Text("Tap to add some notes"))
                        .textFieldStyle(.roundedBorder)
                } else {
                    Text(" ")
                    Text(" ")
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    NavigationStack {
        GameResultsView(gameManager: GameManager(gameType: .addition))
            .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
    }
}
