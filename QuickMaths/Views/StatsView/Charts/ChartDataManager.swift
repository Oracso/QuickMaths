//
//  ChartDataManager.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import Foundation

struct ChartDataManager {
    
    static func gameHighScores(_ gameLogs: [GameLog]) -> ChartData {
        var chartItems: [ChartItem] = []
        for log in gameLogs {
            chartItems.append(ChartItem(key: log.chartDate, value: Double(log.correctAnswers)))
        }
        return ChartData(xAxis: "time", yAxis: "high score", chartItems: chartItems)
    }
    
    static func gameTypeHighScores(_ gameLogs: [GameLog]) -> ChartData {
        var chartItems: [ChartItem] = []
        for gameType in GameType.allCases {
            let gameTypedLogs = gameLogs.filter({ $0.gameType == gameType.rawValue})
            let highest = gameTypedLogs.sorted { $0.correctAnswers > $1.correctAnswers }.first?.correctAnswers ?? 0
            chartItems.append(ChartItem(key: gameType.gameSymbol(), value: Double(highest)))
        }
        return ChartData(xAxis: "game type", yAxis: "high score", chartItems: chartItems)
    }
    
}
