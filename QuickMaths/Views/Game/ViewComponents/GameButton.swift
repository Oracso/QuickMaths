//
//  GameButton.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 03/02/2024.
//

import SwiftUI

struct GameButton: View {
    let text: String
    let count: Int
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.5)
                .clipShape(.buttonBorder)
            Text(text.capitalized)
        }
            .containerRelativeFrame(.horizontal, count: count, spacing: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .containerRelativeFrame(.vertical, count: 8, spacing: 30.0)
    }
}

#Preview {
    GameButton(text: "Home", count: 4)
}
