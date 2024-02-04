//
//  InputTextBox.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 04/02/2024.
//

import SwiftUI

struct InputTextBox: View {
    @Binding var text: String
    var whichSign = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .containerRelativeFrame(.horizontal, count: 2, spacing: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: 60)
                .border(.gray).opacity(0.4)
            if whichSign {
                Text(WhichSign.getSymbol(text))
                    .font(.system(size: 36))
            } else {
                Text(text)
                    .font(.system(size: 36))
            }
                
        }
        
    }
}

#Preview {
    InputTextBox(text: .createBinding("text"))
}
