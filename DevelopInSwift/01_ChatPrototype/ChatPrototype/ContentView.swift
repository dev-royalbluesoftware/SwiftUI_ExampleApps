//
//
// ChatPrototype
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Knock, knock!")
                .padding()
                .background(.yellow, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 10, x: -4, y: 10)
            
            Text("Who's there?")
                .padding()
                .background(.teal, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 10, x: -4, y: 10)
            
            Text("Boo!")
                .padding()
                .background(.yellow, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 10, x: -4, y: 10)
            
            Text("Boo, Who?")
                .padding()
                .background(.teal, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 10, x: -4, y: 10)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
