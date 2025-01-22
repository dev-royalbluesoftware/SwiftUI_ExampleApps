//
//
// ToDoList
// DetailView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import SwiftUI

struct DetailView: View {
    
    var passedValue: String // don't initialize this - it will be passed in from the parent view
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
       VStack {
           Spacer()
           
           Image(systemName: "swift")
               .resizable()
               .scaledToFit( )
               .foregroundStyle(.orange)
           
           Text("You Are A Swifty Legend!\n And the value passed in was: \(passedValue)")
               .font(.largeTitle)
               .multilineTextAlignment(.center)
           
           Spacer()
           
           Button("Get Back!") {
               dismiss()
           }
           .buttonStyle(.borderedProminent)
           .tint(.indigo)
        }
       .padding()
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}
