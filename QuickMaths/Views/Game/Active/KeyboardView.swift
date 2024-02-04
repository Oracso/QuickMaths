//
//  KeyboardView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct KeyboardView: View {
    
    @Binding var inputText: String
    @Binding var answer: Double?
    @Binding var questionTries: Int
    
    let submitAnswer: () -> Void
    
    let gameType: GameType
    
    func convertAnswerToInt() {
        answer = Double(inputText)
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
        switch gameType {
        case .addition:
            normalSubmit(num)
        case .subtraction:
            subtractionSubmit(num)
        case .multiplication:
            normalSubmit(num)
        case .division:
            divisionSubmit(num)
        case .whichSign:
            whichSignSubmit(num)
        }
    }
    
    func normalSubmit(_ num: Int) {
        if inputText == " " {
            inputText = String(num)
        } else {
            inputText += String(num)
        }
    }
    
    func divisionSubmit(_ num: Int) {
        if inputText == " " {
            if num == 10 {
                inputText = "0."
            } else {
                inputText = String(num)
            }
        } else {
            if inputText == "0." {
                if num == 10 {
                    inputText = " "
                } else {
                    inputText += String(num)
                }
            } else {
                if inputText.contains(".") {
                    if num == 10 {
                        // nil
                    } else {
                        inputText += String(num)
                    }
                } else {
                    if num == 10 {
                        inputText += "."
                    } else {
                        inputText += String(num)
                    }
                }
            }
        }
    }
    
    func subtractionSubmit(_ num: Int) {
        if inputText == " " {
            if num == -1 {
                inputText = "-"
            } else {
                inputText = String(num)
            }
        } else {
            if inputText == "-" {
                if num == -1 {
                    inputText = " "
                } else {
                    inputText = String(num * -1)
                }
            } else {
                if num == -1 {
                    inputText = String(Int(inputText)! * -1)
                } else {
                    inputText += String(num)
                }
            }
        }
    }
    
    func whichSignSubmit(_ num: Int) {
        if inputText == " " {
            inputText = String(num)
        } else {
            if gameType == .whichSign {
                inputText = String(num)
            } else {
                inputText += String(num)
            }
        }
    }
    
    func submitButton() {
        if inputText != " " {
            questionTries += 1
            convertAnswerToInt()
        }
    }
    
    var body: some View {
        
        VStack {
            if gameType == .whichSign {
                Spacer()
                InputTextBox(text: $inputText, whichSign: true)
                Spacer()
                HStack {
                    ForEach(WhichSign.allCases) { sign in
                        Button {
                            pressButton(sign.rawValue)
                        } label: {
                            KeyboardButtonView(sign.gameSymbol())
                        }
                    }
                }
                Spacer()
            } else {
                InputTextBox(text: $inputText)
                
                LazyVGrid(columns: gridItemLayout, spacing: 0) {
                    ForEach((1...9), id: \.self) { num in
                        Button {
                            pressButton(num)
                        } label: {
                            KeyboardButtonView(String(num))
                        }
                    }
                }
                
                LazyVGrid(columns: gridItemLayout, spacing: 0) {
                    if gameType == .subtraction {
                        Button {
                            pressButton(-1)
                        } label: {
                            KeyboardButtonView("-")
                        }
                    } else {
                        Spacer()
                    }
                    
                    Button {
                        pressButton(0)
                    } label: {
                        KeyboardButtonView(String(0))
                    }
                    
                    if gameType == .division {
                        Button {
                            pressButton(10)
                        } label: {
                            KeyboardButtonView("•")
                        }
                    } else {
                        Spacer()
                    }
                    
                }
            }
            
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                Button {
                    backspace()
                } label: {
                    KeyboardButtonView("arrow.left", true)
                }
                Spacer()
                Button {
                    submitButton()
                } label: {
                    KeyboardButtonView("GO")
                }
            }
            
        }
        
    }
}

#Preview {
    KeyboardView(inputText: .createBinding(" "), answer: .createBinding(nil), questionTries: .createBinding(0), submitAnswer: {}, gameType: .addition)
}

