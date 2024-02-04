//
//  WhichSign.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 02/02/2024.
//

import Foundation

enum WhichSign: Int, Identifiable, CaseIterable {
    case add = 1
    case subtract = 2
    case multiply = 3
    case divide = 4
    
    var id: WhichSign { self }
}

extension WhichSign {
    func gameSymbol() -> String {
        switch self {
        case .add:
            "+"
        case .subtract:
            "-"
        case .multiply:
            "x"
        case .divide:
            "÷"
        }
    }
    
    static func getSymbol(_ num: String) -> String {
        switch num {
        case "1":
            "+"
        case "2":
            "-"
        case "3":
            "x"
        case "4":
            "÷"
        default:
            " "
        }
    }
}
