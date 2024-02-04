//
//  KeyboardButtonView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 02/02/2024.
//

import SwiftUI

struct KeyboardButtonView: View {
    
    init(_ string: String, _ image: Bool = false) {
        self.string = string
        self.image = image
    }
    
    let string: String
    let image: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.5)
            if image {
                Image(systemName: string)
            } else {
                Text(string)
            }
        }
            .font(.system(size: 30))
            .cornerRadius(10)
        
            .containerRelativeFrame(.horizontal, count: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .frame(height: 90)
        
            .padding(.vertical, 10)
        
    }
}

#Preview {
    KeyboardButtonView("1")
}
