//
//  GameLogListView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct GameLogListView: View {
     init(_ log: GameLog) {
        self.log = log
    }
    
    @ObservedObject var log: GameLog
    var body: some View {
        HStack {
            Text(log.listDate)
            Spacer()
            Text("N: \(log.numberFreq) R: \(log.numberRange)")
            Text("(\(log.gameSymbol()))")
            Text("(\(log.duration)s)")
            
            Text("Score: \(log.correctAnswers)")
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    GameLogListView(.example())
}
