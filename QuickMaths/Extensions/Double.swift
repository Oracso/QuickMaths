//
//  Double.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 03/02/2024.
//

import Foundation

extension Double {
    func roundToIntOrDouble() -> String {
        
        func intOrDouble(_ answer: Double) -> IntOrDouble {
            if answer.truncatingRemainder(dividingBy: 1) == 0 {
                return .int(Int(answer))
            } else {
                return .double(answer)
            }
        }
        
        enum IntOrDouble {
            case int(Int)
            case double(Double)
        }
        
        var answer: String {
            let ans = intOrDouble(self)
            switch ans {
            case .int(let int):
                return String(int)
            case .double(let double):
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                return formatter.string(from: NSNumber(value: double)) ?? "-666"
            }
        }
        
        return answer
        
    }
}
