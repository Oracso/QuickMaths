//
//  QuickMathsManager.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 30/01/2024.
//

import Foundation

struct QuickMathsManager {
    
    let calculator = Calculator()
    
    func getResult(_ gameType: GameType, _ numbers: Int, _ range: Int) -> (question: String, answer: Double) {
        switch gameType {
        case .addition:
            addition(numbers, range)
        case .subtraction:
            subtraction(numbers, range)
        case .multiplication:
            multiplication(numbers, range)
        case .division:
            division(numbers, range)
        case .whichSign:
            whichSign(numbers, range)
        }
    }
    
    func addition( _ numbers: Int, _ range: Int) -> (question: String, answer: Double) {
        
        var allNumbers: [Int] = []
        
        for _ in 1...numbers {
            let n = Int.random(in: 1...range)
            allNumbers.append(n)
        }
        
        let doubleArray = allNumbers.map { Double($0)}
        let answer = calculator.sum(doubleArray)
        
        let strings = allNumbers.map { String($0) }
        
        let joined = strings.joined(separator: " + ")
        
        return (joined, answer)
    }
    
    func subtraction( _ numbers: Int, _ range: Int) -> (question: String, answer: Double) {
        
        var allNumbers: [Int] = []
        
        for _ in 1...numbers {
            let n = Int.random(in: 1...range)
            allNumbers.append(n)
        }
        
        let doubleArray = allNumbers.map { Double($0)}
        let first = doubleArray.first!
        
        let answer = (calculator.sum(doubleArray) * -1) + first * 2
        
        let strings = allNumbers.map { String($0) }
        
        let joined = strings.joined(separator: " - ")
        
        return (joined, answer)
    }
    
    
    func multiplication( _ numbers: Int, _ range: Int) -> (question: String, answer: Double) {
        
        var allNumbers: [Int] = []
        
        for _ in 1...numbers {
            let n = Int.random(in: 1...range)
            allNumbers.append(n)
        }
        
        var previousNumber = 1.0
        
        for number in allNumbers {
            previousNumber = Double(number) * previousNumber
        }
        
        let strings = allNumbers.map { String($0) }
        
        let joined = strings.joined(separator: " x ")
        
        return (joined, previousNumber)
    }
    
    func division( _ numbers: Int, _ range: Int) -> (question: String, answer: Double) {
        
        var allNumbers: [Double] = []
        
        for _ in 1...numbers {
            let n = Int.random(in: 1...range)
            allNumbers.append(Double(n))
        }
        
        var previousNumber = 1.0
        
        for number in allNumbers {
            previousNumber = Double(number) / previousNumber
        }
        
        var strings = allNumbers.map { String(Int($0)) }
        strings.swapAt(0, 1)
        let joined = strings.joined(separator: " ÷ ")
        
        var roundedNumber: Double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            let rounded = formatter.string(from: NSNumber(value: previousNumber)) ?? "-666"
            return Double(rounded) ?? -666
        }
        
        return (joined, roundedNumber)
    }
    
    
    func whichSign( _ numbers: Int, _ range: Int) -> (question: String, answer: Double) {
        
        let sign = WhichSign.allCases.randomElement() ?? .add
        
        var result : (question: String, answer: Double)
        
        switch sign {
        case .add:
            result = addition(numbers, range)
        case .subtract:
            result = subtraction(numbers, range)
        case .multiply:
            result = multiplication(numbers, range)
        case .divide:
            result = division(numbers, range)
        }
        
        let answer = result.answer.roundToIntOrDouble()
        
        let question = result.question.replacingOccurrences(of: sign.gameSymbol(), with: " ? ") + "  =  \(answer)"
        
        return (question, Double(sign.rawValue))
    }
    
}



extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
