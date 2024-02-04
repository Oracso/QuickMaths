//
//  GameConfigHighScoreView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct GameConfigHighScoreView: View {
    @EnvironmentObject var ads: AppDataStore
    @ObservedObject var gameManager: GameManager
    @StateObject var statsDataManager = StatsDataManager()
    
    func setUp() {
        statsDataManager.gameType = gameManager.gameType
        calculate()
    }
    
    func calculate() {
        statsDataManager.gameFreq = gameManager.numberFreq
        statsDataManager.gameRange = gameManager.numberRange
        statsDataManager.gameDuration = gameManager.timerManager.timerLength
        
        statsDataManager.updateArrayFilters(ads.objects.gameLogOS.gameLogs)
        statsDataManager.highScoreStats()
        statsDataManager.incorrectStats()
    }
    
    var body: some View {
        VStack {
            Text("High Score: \(statsDataManager.highestScore)")
                .font(.system(size: 24))
            HStack {
                Text("Highest Incorrect: \(statsDataManager.highestIncorrect)")
                Text("Lowest Incorrect: \(statsDataManager.lowestIncorrect)")
                
            }
        }
        .padding()
        .border(.gray)
        .padding(.top)
        
        .onAppear() {
            setUp()
        }
        
        .onChange(of: gameManager.numberFreq) {
            calculate()
        }
        .onChange(of: gameManager.numberRange) {
            calculate()
        }
        .onChange(of: gameManager.timerManager.timerLength) {
            calculate()
        }
        
    }
}

#Preview {
    NavigationStack {
        GameConfigHighScoreView(gameManager: .example)
            .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
    }
}
