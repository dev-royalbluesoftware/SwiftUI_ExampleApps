//
//
// ToDoList
// ToDoListView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

struct ToDoListView: View {

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<100, id: \.self) { number in
                    NavigationLink {
                        DetailView(passedValue: "Item \(number)")
                    } label: {
                        Text("Item \(number)")
                    }
                }
            }
            .navigationTitle("School Year")
            .listStyle(.plain)
        }
    }
}

#Preview {
    ToDoListView()
}
