//
//
// PokeDex
// CreaturesListView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct CreaturesListView: View {
    
    // MARK: - Properties
    
    @State var creatures = Creatures()
    
    var body: some View {
        NavigationStack {
            List(creatures.creaturesArray, id: \.self) { creature in  // View-only data so don't need ForEach
                NavigationLink {
                    DetailView(creature: creature)
                    
                } label: {
                    Text(creature.name.capitalized)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("PokeDex")
        }
        .task {
            await creatures.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
