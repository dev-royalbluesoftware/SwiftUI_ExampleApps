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
            ZStack {
                List(0..<creatures.creaturesArray.count, id: \.self) { index in  // View-only data so don't need ForEach
                    LazyVStack {
                        NavigationLink {
                            DetailView(creature: creatures.creaturesArray[index])
                            
                        } label: {
                            Text("\(index + 1). \(creatures.creaturesArray[index].name.capitalized)")
                                .font(.title2)
                        }
                    }
                    .task {
                        guard let lastCreature = creatures.creaturesArray.last else { return }
                        if creatures.creaturesArray[index].name == lastCreature.name && creatures.urlString.hasPrefix("http") {
                            await creatures.getData()
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("PokeDex")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Load All") {
                            Task {
                                await creatures.loadAll()
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .status) {
                        Text("\(creatures.creaturesArray.count) of \(creatures.count) creatures")
                    }
                }
                
                if creatures.isLoading {
                    ProgressView()
                        .tint(.red)
                        .scaleEffect(4)
                }
            }
        }
        .task {
            await creatures.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
