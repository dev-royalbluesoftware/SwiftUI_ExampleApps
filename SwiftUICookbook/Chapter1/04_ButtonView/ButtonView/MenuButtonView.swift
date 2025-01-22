//
//
// ButtonView
// MenuButtonView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct MenuButtonView: View {
    
    var body: some View {
        Menu("Choose a country") {
            Button("France") { print("France selected") }
            Button("Spain") { print("Spain selected") }
            Button("Italy") { print("Italy selected") }
            Button("USA") { print("USA selected") }
        }
        .navigationTitle("MenuButtons")
    }
}

#Preview {
    NavigationStack {
        MenuButtonView()
    }
}
