//
//  SaveGameToggle.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct SaveGameToggle: View {
    @Binding var saveGame: Bool
    var body: some View {
        ZStack {
            Capsule()
                .frame(width:80, height:44)
                .foregroundStyle(Color(saveGame ? #colorLiteral(red: 0.02882496826, green: 0.9960961938, blue: 0.004087608308, alpha: 1) : #colorLiteral(red: 0.9977727532, green: 0.002769516082, blue: 0.1662880182, alpha: 1)))
            ZStack {
                Circle()
                    .frame(width:40, height:40)
                    .foregroundColor(.white)
                Image(systemName: saveGame ? "checkmark" : "xmark")
            }
            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
            .offset(x:saveGame ? 18 : -18)
            .padding(24)
        }
        .animation(.spring(), value: saveGame)
        
        .onTapGesture {
            saveGame.toggle()
        }
        
    }
}

#Preview {
    SaveGameToggle(saveGame: .constant(true))
}
