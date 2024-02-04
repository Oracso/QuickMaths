//
//  LineChartView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI
import Charts

struct LineChartView: View {
    let chartData: ChartData
    var body: some View {
        Chart {
            ForEach(chartData.chartItems) { item in
                LineMark(
                    x: .value(chartData.xAxis.capitalized, item.key.capitalized),
                    y: .value(chartData.yAxis.capitalized, item.value)
                )
            }
        }
        
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text(chartData.xAxis.capitalized).bold()
        }
        
        .chartYAxisLabel {
            Text(chartData.yAxis.capitalized).bold()
        }
    }
}

#Preview {
    LineChartView(chartData: .example)
}
