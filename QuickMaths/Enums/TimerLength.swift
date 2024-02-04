//
//  TimerLength.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 03/02/2024.
//

import Foundation

enum TimerLength: Int, Codable, CaseIterable, Identifiable {
    case zero = 0
    case thirty = 30
    case sixty = 60
    case ninety = 90
    case oneTwenty = 120
    case oneFifty = 150
    case oneEighty = 180
    var id: TimerLength { self }
}
