//
//  EntityType.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import CoreData

enum EntityType: String, Identifiable, CaseIterable, Codable {
    case gameLog = "GameLog"
    var id: Self { self }
}

extension EntityType {
    func entityClass() -> NSManagedObject.Type {
        switch self {
        case .gameLog:
            return GameLog.self
        }
    }
}



