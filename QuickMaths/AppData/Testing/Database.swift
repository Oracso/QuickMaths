//
//  Database.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation

class Database: ObservableObject {
    @Published var allGameLogs: [GameLog] = []
}
