//
//  TimerManager.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

struct TimerManager {
    
    var timer: Timer?
  
    var secondsRemaining = 0

    var timerDuration = 0
    
    var timerProgress: Double {
        get {
            Double(secondsRemaining) / Double(timerDuration)
        }
        set {  }
    }
    
    var dateStarted: Date = .now
    
}


// TODO: how to stop timer being set at 0 ?

// TODO: Where to put this func
extension TimerManager {
    static func lengthToSeconds(_ timerLength: Double) -> Int {
        switch timerLength {
        // TODO: For Delete --- Testing code
        case 0.5: 5
//        case 0.5: 30
        case 1: 60
        case 1.5: 90
        case 2: 120
        case 2.5: 150
        case 3: 180
        default: 0
        }
    }
}
