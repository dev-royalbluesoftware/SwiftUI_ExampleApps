//
//
// ButtonView
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                NavigationLink("Buttons") {
                    ButtonView()
                }
               NavigationLink("EditButtons") {
                   EditButtonView()
                }
                
                NavigationLink("PasteButtons") {
                    PasteButtonView()
                }
                
                NavigationLink("Details about text") {
                    Text("Very long text that should not be displayed in a single line because it is not good design.")
                        .padding()
                        .navigationTitle(Text("Detail"))
                }
            }
            .navigationTitle(Text("Main View"))
        }
    }
}

#Preview {
    ContentView()
}
