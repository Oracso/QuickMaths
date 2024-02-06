//
//  Extensions.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import Foundation
import SwiftUI

// MARK: - Create Binding

extension Binding {
    static func createBinding(_ value: Value) -> Binding<Value> {
        var bindingValue = value
        return Binding(
            get: { bindingValue },
            set: { newValue in
                bindingValue = newValue
            }
        )
    }
}

public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }
        return window
    }
}


extension Date {
    func daysDif(_ days: Int) -> Date {
        let seconds = Double(-86400 * days)
        return self.addingTimeInterval(seconds)
    }
}
