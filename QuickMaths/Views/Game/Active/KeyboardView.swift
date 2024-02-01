//
//  KeyboardView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct KeyboardView: View {
    
    @Binding var inputText: String
    @Binding var answer: Int?
    @Binding var questionTries: Int
    
    let submitAnswer: () -> Void
    
    func convertAnswerToInt() {
        answer = Int(inputText)
        submitAnswer()
    }
    
    var gridItemLayout = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    func backspace() {
        inputText = String(inputText.dropLast())
        if inputText == "" {
            inputText = " "
        }
    }
    
    func pressButton(_ num: Int) {
        if inputText == " " {
            inputText = String(num)
        } else {
            inputText += String(num)
        }
    }
    
    
    var body: some View {
        
        
        
        VStack {
            
                        Text(inputText)
            
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                ForEach((1...9), id: \.self) { num in
                    
                    Button {
                        pressButton(num)
//                        inputText += String(num)
                    } label: {
                        Text(String(num))
                    }
                    .keyboardButton()
                    
                    .border(.red)
                }
            }
            
            
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                
                Spacer()
                
                Button {
                    pressButton(0)
//                    inputText += String(0)
                } label: {
                    Text(String("0"))
                }
                
                .keyboardButton()
                
                Spacer()
                
            }
            
            
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                
                Button {
                    backspace()
                } label: {
                    Image(systemName: "arrow.left")
                }
                
                
                .keyboardButton()
                
                Spacer()
                
                Button {
                    //                    submitButton.toggle()
                    questionTries += 1
                    convertAnswerToInt()
                } label: {
                    Text(String("GO"))
                        .keyboardButton()
                }
                
                
            }
            
            
            
        }
        
        
        
        
    }
}

#Preview {
    KeyboardView(inputText: .constant(" "), answer: .constant(nil), questionTries: .constant(0), submitAnswer: {})
}

extension View {
    func keyboardButton() -> some View {
        modifier(KeyboardButtonModifier())
    }
}



struct KeyboardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .frame(width: 50, height: 80)
            .cornerRadius(10)
      }
}
