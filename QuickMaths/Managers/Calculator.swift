//
//  Calculator.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 30/01/2024.
//

import Foundation

class Calculator {
    
    
    // Basic Operations
    

    func sum(_ sample: [Double]) -> Double {
        var sum: Double = 0
        for number in sample {
            sum += Double(number)
        }
        return sum
    }
    
    func mean(_ sample: [Double]) -> Double {
        let sum = sum(sample)
        let n = Double(sample.count)
        if n == 0 {
            return 0
        } else {
            let mean = sum / n
            return mean
        }
    }
    
    func double(_ number: Double) -> Double {
        return number * 2
    }
    
    func square(_ number: Double) -> Double {
        return number * number
    }
    
    
    // Get Random Data To Test
    
    func returnRandomDoubleArray(n: Int) -> [Double] {
        var data: [Double] = []
        let count = 1...n
        for number in count {
            data.append(Double(number))
        }
        let shuffledData = data.shuffled()
        return shuffledData
    }
    
    
    func returnRandomIntArray(n: Int) -> [Int] {
        var data: [Int] = []
        let count = 1...n
        for number in count {
            data.append(number)
        }
        let shuffledData = data.shuffled()
        return shuffledData
    }
    
    
    
    //
    
    init() {
        print("Calculator Created")
    }
    
    deinit {
        print("Calculator Destroyed")
    }
    
 
    
}



