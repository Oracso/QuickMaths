//
//  SaveGameToggle.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct SaveGameToggle: View {
    @Binding var saveGame: Bool
    //    @State private var offset: CGFloat = -18
    var body: some View {
        ZStack {
            
            Capsule()
                .frame(width:80, height:44)
                .foregroundColor(Color(saveGame ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1028798084) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6039008336)))
            //                .foregroundColor(.blue)
            
            ZStack {
                Circle()
                    .frame(width:40, height:40)
                    .foregroundColor(.white)
                
                Image(systemName: saveGame ? "sun.max.fill" : "moon.fill")
            }
            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
            .offset(x:saveGame ? 18 : -18)
            //            .offset(x: offset)
            .padding(24)
            //            .animation(Animation.spring(), value: true)
            .animation(.spring())
            
        }
        
        .onTapGesture {
            saveGame.toggle()
        }
        
    }
}

#Preview {
    SaveGameToggle(saveGame: .constant(true))
}
