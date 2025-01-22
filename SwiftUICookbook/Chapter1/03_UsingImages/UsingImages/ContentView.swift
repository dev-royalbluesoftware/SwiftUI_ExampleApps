//
//
// UsingImages
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("dogs1")
                .resizable()
                .scaledToFit()
            
            Image(.dogAndNature)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 6))
                .shadow(radius: 10)
            
            Image(uiImage: UIImage(resource: .dog2))
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ContentView()
}
