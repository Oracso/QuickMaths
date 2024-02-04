//
//  TimerManager.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import Foundation

struct TimerManager {
    
    var timer: Timer?
  
    var timerLength: TimerLength = .zero
    
    var totalDuration = 0
    
    var secondsRemaining = 0

    var questionDuration = 0
    
    var timerProgress: Double {
        get {
            Double(secondsRemaining) / Double(totalDuration)
        }
        set {  }
    }
    
    var dateStarted: Date = .now
    
}
