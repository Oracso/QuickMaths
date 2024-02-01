//
//  ProgressBar.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var timerProgress: Double
    var body: some View {
        
        VStack {
            GeometryReader { geo in
                
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(width: geo.size.width, height: 7)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                        .cornerRadius(10)
                    
                    
                    Rectangle()
                        .frame(width: geo.size.width * timerProgress, height: 7)
                        .foregroundColor(Color.accentColor)
                        .cornerRadius(10)
                    
                    
                    
                }
                .frame(maxWidth: .infinity)
                
                
                
                
                
            }
//            .padding(.horizontal, 15)
            .fixedSize(horizontal: false, vertical: true)
            
            
        }
        
        
        
    }
}

#Preview {
    ProgressBar(timerProgress: .constant(0.5))
}
