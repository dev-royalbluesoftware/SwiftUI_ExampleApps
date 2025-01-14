//
//
// ElvisCostelloChallenge
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var messageString = ""
    @State private var imageName = ""
    
    // MARK: - ContentView Body
    
    var body: some View {
        VStack {
            Text("What's So Funny 'Bout")
                .font(.largeTitle.weight(.black))
                .foregroundStyle(.purple)
                
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .shadow(radius: 15)
                .frame(width: 300, height: 300)
            
            Text(messageString)
                .font(.largeTitle.weight(.black))
                .foregroundStyle(.purple)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            HStack {
                Button("Peace") {
                    imageName = "peacesign"
                    messageString = "Peace"
                }
                
                Button("Love") {
                    imageName = "heart"
                    messageString = "Love"
                }
                
                Button("Understanding") {
                    imageName = "lightbulb"
                    messageString = "Understanding"
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
