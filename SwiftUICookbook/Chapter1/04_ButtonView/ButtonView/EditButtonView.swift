//
//
// ButtonView
// EditButtonView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct EditButtonView: View {
    
    // MARK: - State Properties
    
    @State private var animals = ["Cats", "Dogs", "Birds", "Lizards", "Goats"]
    
    var body: some View {
        List {
            ForEach(animals, id: \.self) { animal in
                Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("Edit Button")
    }
    
    // MARK: - Helper Functions
    
    func removeAnimal(at offsets: IndexSet) {
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack {
        EditButtonView()        
    }
}
