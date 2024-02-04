//
//  StatsView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 03/02/2024.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var ads: AppDataStore
    @StateObject var statsDataManager = StatsDataManager()
    
    func updateFilters() {
        statsDataManager.updateArrayFilters(ads.objects.gameLogOS.gameLogs)
        statsDataManager.highScoreStats()
    }
    
    var body: some View {
        
        VStack {
            
            Picker(selection: $statsDataManager.gameType) {
                ForEach(GameType.allCases) { type in
                    Text(type.gameSymbol())
                }
            } label: {
                Text("Game Type")
            }
            .pickerStyle(.palette)
            
            GameConfigSlidersView($statsDataManager.gameFreq, $statsDataManager.gameRange)
            
            
            Picker(selection: $statsDataManager.gameDuration) {
                ForEach(TimerLength.allCases) { type in
                    if type == .zero {
                        Text("All")
                    } else {
                        Text("\(type.rawValue)s")
                    }
                }
            } label: {
                Text("Game Type")
            }
            .pickerStyle(.palette)
            
            List {
                Section("OverView:") {
                    Text("No. of Games: \(statsDataManager.filteredLogs.count.description)")
                    Text("Highest Score: \(statsDataManager.highestScore)")
                    Text("Lowest Score: \(statsDataManager.lowestScore)")
                    Text("Average Score: \(statsDataManager.averageScore.roundToIntOrDouble())")
                }
                
                Section("Incorrect:") {
                    Text("Highest Incorrect Answers: \(statsDataManager.highestIncorrect)")
                    Text("Lowest Incorrect Answers: \(statsDataManager.lowestIncorrect)")
                    Text("Average Incorrect Answers: \(statsDataManager.averageIncorrect.roundToIntOrDouble())")
                }
                
                Section("Charts:") {
                    if statsDataManager.filteredLogs.isEmpty == false {
                        LineChartView(chartData: ChartDataManager.gameHighScores(statsDataManager.filteredLogs))
                            .frame(minHeight: 200)
                    }
                    
                    BarChartView(chartData: ChartDataManager.gameTypeHighScores(ads.objects.gameLogOS.gameLogs))
                        .frame(minHeight: 200)
                    
                }
                
            }
            
        }
        
        .navigationTitle("Game Statistics")
        
        .onAppear() {
            updateFilters()
        }
        
        .onChange(of: statsDataManager.gameType) {
            updateFilters()
        }
        .onChange(of: statsDataManager.gameDuration) {
            updateFilters()
        }
        .onChange(of: statsDataManager.gameFreq) {
            updateFilters()
        }
        .onChange(of: statsDataManager.gameRange) {
            updateFilters()
        }
        
    }
}

#Preview {
    NavigationStack {
        StatsView()
            .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
        
    }
}
