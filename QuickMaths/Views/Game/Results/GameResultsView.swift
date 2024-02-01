//
//  GameResultsView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import SwiftUI

struct GameResultsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var gameManager: GameManager
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            SaveGameToggle(saveGame: $gameManager.saveGame)
            
            HStack {
                Button("Home") {
                    mode.wrappedValue.dismiss()
                }
                Button("Again") {
                    // reset game parameters
                    dismiss()
                }
            }
            
        }
    }
}

#Preview {
    GameResultsView(gameManager: GameManager(gameType: .addition))
}
