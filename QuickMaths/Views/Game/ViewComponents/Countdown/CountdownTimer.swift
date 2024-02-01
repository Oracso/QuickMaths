//
//  CountdownTimer.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct CountdownTimer: View {
    @Binding var secondsRemaining: Int
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.gray)
                .opacity(0.5)
            
            Text("\(secondsRemaining)")
        }
        .frame(maxWidth: 40)
        
    }
}

#Preview {
    CountdownTimer(secondsRemaining: .constant(10))
}
