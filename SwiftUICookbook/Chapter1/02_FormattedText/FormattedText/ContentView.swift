//
//
// FormattedText
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var password = "1234"
    @State private var someText = "initial text"
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
            
            SecureField("Enter a password", text: $password)
                .padding()
            
            Text("password entered: \(password)")
                .italic()
            
            TextField("Enter some text", text: $someText)
                .padding()
            
            Text(someText)
                .font(.largeTitle)
                .underline()
            
            Text("Changing text color and make it bold")
                .foregroundStyle(.teal)
                .bold()
        
            Text("Use kerning to chage spacing between characters in the text")
                .kerning(7)
            
            Text("Changing baseline offset")
                .baselineOffset(100)
                .border(.purple, width: 1)
            
            Text("Strikethrough")
                .strikethrough()
            
            Text("This is multiline text implemented in SwiftUI.  The trailing modifier was added to the text.  This text also implements multiple modifiers")
                .background(.yellow)
                .multilineTextAlignment(.trailing)
                .lineSpacing(15)
                
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
