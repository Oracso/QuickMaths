//
//  TimerManager.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

struct TimerManager {
    
    // TODO: How to delay the init of this
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var hasTimerStarted = false
    var hasTimerFinished = false
    
//    @Published var timeRemaining = 0
    var secondsRemaining = 0
//    @Published var savedDuration = 0
    var timerDuration = 0
//    @Published var timerLength: Double = 0
    
//    var timerProgress: Double = 1 {
//        Double(secondsRemaining) / Double(timerDuration)
//    }
    
    var timerProgress: Double {
        get {
            Double(secondsRemaining) / Double(timerDuration)
        }
        set {  }
    }
    
    var dateStarted: Date = .now
    
    
}

//extension TimerManager {
//    func updateProgressBar() {
//        timerProgress =  Double(timerDuration / secondsRemaining)
//    }
//}


// TODO: Where to put this func
extension TimerManager {
    static func lengthToSeconds(_ timerLength: Double) -> Int {
        switch timerLength {
            // change this
        case 0.5: 30
        case 1: 60
        case 1.5: 90
        case 2: 120
        case 2.5: 150
        case 3: 180
        default: 0
        }
    }
}
