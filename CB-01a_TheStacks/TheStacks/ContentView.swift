//
//
// TheStacks
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("VStack Item 1")
            
            Text("VStack Item 2")
            
            Spacer()
            
            Divider()
                .background(.black)
            
            Text("VStack Item 3")
            
            HStack {
                Text("HStack Item 1")
                
                Text("HStack Item 2")
                
                Text("HStack Item 3")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            .background(.red)
            
            ZStack {
                Text("ZStack Item 1")
                    .padding()
                    .background(.green)
                    .opacity(0.8)
                
                Text("ZStack Item 2")
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .offset(x: 80, y: -400)
            }
        }
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
