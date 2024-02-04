//
//  GameScoreBoardView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 02/02/2024.
//

import SwiftUI

struct GameScoreBoardView: View {
    
    @Binding var questionNumber: Int
    @Binding var correctAnswers: Int
    let timeRemaining = 10
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.purple)
                .opacity(0.6)
            HStack() {
                Spacer()
                Text("Asked: \(questionNumber)")
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(1)
                    Text(String(timeRemaining))
                }
                Spacer()
                Text("Correct: \(correctAnswers)")
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 30)
        .cornerRadius(30)
        .padding(.horizontal, 20)
    }
}

#Preview {
    GameScoreBoardView(questionNumber: .createBinding(5), correctAnswers: .createBinding(5))
}
