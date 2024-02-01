//
//  JSONManager.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 01/02/2024.
//

import Foundation

struct JSONManager {
    
    static func jsonStringToDictionary(jsonString: String) -> [Int : Int] {
        do {
            let jsonData = jsonString.data(using: .utf8)
            return try JSONDecoder().decode([Int: Int].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
            return [:]
        }
    }
    
}
