//
//
// YouAreAwesome
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
    @State private var imageNumber = 0
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 15)
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.75)
                .multilineTextAlignment(.center)
                .foregroundStyle(.indigo)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            HStack {
                Button("Show Message") {
                    // This is the action performed when the button is pressed
                    let messageAwesome = "You Are Awesome!"
                    let messageGreat = "You Are Great!"
                    
                    messageString = messageString.isEmpty ? messageAwesome : messageString == messageAwesome ? messageGreat : messageAwesome
                    
                    imageName = "image\(imageNumber)"
                    imageNumber += 1
                    if imageNumber > 9 {
                        imageNumber = 0
                    }
                }
                .tint(.green)
                
                Button("Clear") {
                    // This is the action performed when the button is pressed
                    messageString = ""
                    imageName = ""
                }
                .tint(.indigo)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
