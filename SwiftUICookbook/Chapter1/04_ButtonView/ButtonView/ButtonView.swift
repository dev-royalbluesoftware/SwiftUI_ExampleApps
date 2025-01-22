//
//
// ButtonView
// ButtonView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ButtonView: View {
    
    // MARK: - State Properties
    
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Welcome to your second view")
            
            Text("Current count value: \(count)")
                .padding()
            Button {
                count += 1
            } label: {
                Text("Tap to Increment Count")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(Capsule())
            }
        }
        .navigationBarTitle("Button View")
    }
}

#Preview {
    NavigationStack {
        ButtonView()
    }
}
