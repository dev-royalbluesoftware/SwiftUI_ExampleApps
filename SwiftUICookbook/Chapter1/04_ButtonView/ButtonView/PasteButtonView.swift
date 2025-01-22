//
//
// ButtonView
// PasteButtonView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

struct PasteButtonView: View {
    
    // MARK: - State Properties
    
    @State private var text = String()
    
    var body: some View {
        VStack {
            Text("PasteButton controls how you paste in MacOS but is not available on iOS.  For more information, see https://developer.apple.com/documentation/swiftui")
                .padding()
        }
        .navigationTitle("PasteButton")
    }
}

#Preview {
    NavigationStack {
        PasteButtonView()
    }
}
