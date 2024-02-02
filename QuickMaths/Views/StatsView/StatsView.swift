//
//  StatsView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 02/02/2024.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        
        VStack {
            
            
            VStack {
                HStack {
                    
                    Picker(selection: $gameType) {
                        ForEach(GameType.allCases) { type in
                            Text(type.rawValue.capitalized)
                        }
                    } label: {
                        Text("Game Type")
                    }
                    
                    Picker(selection: $gameDuration) {
                        ForEach(GameDuration.allCases) { duration in
                            if duration == .all {
                                Text("Duration: All")
                            } else {
                                Text("Duration: \(duration.rawValue.description)")
                            }
                        }
                    } label: {
                        Text("Game Duration")
                    }
                    
                    
                }
                
                HStack {
                    Picker(selection: $gameNumbers) {
                        ForEach(1...10, id: \.self) { num in
                            if num == 1 {
                                Text("Numbers: All")
                            } else {
                                Text("Numbers: \(num)")
                            }
                        }
                    } label: {
                        Text("Game Numbers")
                    }
                    
                    
                    Picker(selection: $gameRange) {
                        ForEach(1...100, id: \.self) { num in
                            if num == 1 {
                                Text("Numbers: All")
                            } else {
                                Text("Numbers: \(num)")
                            }
                        }
                    } label: {
                        Text("Game Range")
                    }

                    
                    
                }
                
                
            }
            
            
            List {
                
                Section {
                    
                    Text("No. of Games: \(filteredLogs.count.description)")
                    Text("Highest Score: \(highestScore)")
                    Text("Lowest Score: \(lowestScore)")
                    Text("Average Score: \(averageScore)")
                    
                } header: {
                    Text("OverView")
                }
                
                
                Section {
                    Text("Highest No. Tries: \(highestNoTries)")
                    Text("Lowest No. Tries: \(lowestNoTries)")
                    Text("Average Total Tries: \(averageTotalTries)")
                } header: {
                    Text("Tries")
                }
                
                
                Section {
                    NavigationLink {
//                        BarChartView(chartData: returnChartData(query: .highScore))
                    } label: {
                        Text("High Score")
                    }
                    
                    

                } header: {
                    Text("Charts")
                }

                
                
                
                
                
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        StatsView()
    }
}
