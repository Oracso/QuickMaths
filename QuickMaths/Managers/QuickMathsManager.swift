//
//  QuickMathsManager.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 30/01/2024.
//

import Foundation

struct QuickMathsManager {
    
    let calculator = Calculator()
    
    
    func simpleAddition(numbers: Int, range: Int) -> (question: String, answer: Int) {
        
        var allNumbers: [Int] = []
        
        for _ in 1...numbers {
         let n = Int.random(in: 1...range)
            allNumbers.append(n)
        }
        
        let doubleArray = allNumbers.map { Double($0)}
        let answer = calculator.sum(doubleArray)
       
        
        let strings = allNumbers.map { String($0) }
        
        let joined = strings.joined(separator: " + ")
        
        return ("\(joined) =", Int(answer))
        
    }
    
    func simpleSubtraction(numbers: Int, range: Int) -> (question: String, answer: Int) {
        
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
        
        return ("\(joined) =", Int(answer))
        
    }
    
    
    func simpleMultiplication(numbers: Int, range: Int) -> (question: String, answer: Int) {
        
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
        
        return ("\(joined) =", Int(previousNumber))
        
    }
    
    func simpleDivision(numbers: Int, range: Int) -> (question: String, answer: Double) {
        
        var allNumbers: [Double] = []
        
        for _ in 1...numbers {
         let n = Int.random(in: 1...range)
            allNumbers.append(Double(n))
        }
        
        
        var previousNumber = 1.0
        
        for number in allNumbers {
          previousNumber = Double(number) / previousNumber
        }
        
        
        let strings = allNumbers.map { String($0) }
        
        let joined = strings.joined(separator: " ÷ ")
        
        return ("\(joined) =", previousNumber)
        
    }
    
    
//    func whichSign(numbers: Int, range: Int) -> (question: String, answer: Int, sign: Int) {
//        
//        // need to change to 4 if bring divide back in
//        let sign = WhichSign(rawValue: Int.random(in: 1...3))!
//        
//        var result : (question: String, answer: Int)
//        
//        switch sign {
//        case .add:
//           result = simpleAddition(numbers: numbers, range: range)
//        case .subtract:
//           result = simpleSubtraction(numbers: numbers, range: range)
//        case .multiply:
//           result = simpleMultiplication(numbers: numbers, range: range)
////        case .divide:
////            let divisionAnswer = simpleDivision(numbers: numbers, range: range)
////            return (divisionAnswer.question, divisionAnswer.answer, sign.rawValue)
//        }
//        
//        
//        let remove: String
//        switch sign {
//        case .add:
//            remove = "+"
//        case .subtract:
//            remove = "-"
//        case .multiply:
//            remove = "x"
//        }
//    
//        return (result.question.replacingOccurrences(of: remove, with: " ? "), result.answer, sign.rawValue)
//        
//    }
       
        
    

    
    
    
    
    
}



extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
