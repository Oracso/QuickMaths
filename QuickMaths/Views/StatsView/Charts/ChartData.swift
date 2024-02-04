//
//  ChartData.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import Foundation

struct ChartData {
    let xAxis: String
    let yAxis: String
    let chartItems: [ChartItem]
}

struct ChartItem: Identifiable {
    let key: String
    let value: Double
    var id: String { key }
}

extension ChartData {
    static let example = ChartData(
        xAxis: "time",
        yAxis: "attempts",
        chartItems: [
        ChartItem(key: "1", value: 2),
        ChartItem(key: "2", value: 3),
        ChartItem(key: "3", value: 3),
        ChartItem(key: "4", value: 2),
        ChartItem(key: "5", value: 6),
        ChartItem(key: "6", value: 4),
        ChartItem(key: "7", value: 3),
        ChartItem(key: "8", value: 4),
        ChartItem(key: "9", value: 4),
        ChartItem(key: "10", value: 5),
        ]
    )
}

