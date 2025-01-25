//
//
// PokeDex
// DetailView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    
    let creature: Creature
    
    // MARK: - State Properties
    
    @State private var creatureDetail = CreatureDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(creature.name.capitalized)
                .font(Font.custom("Avenir Next Condensed", size: 60))
                .bold()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            HStack {
                AsyncImage(url: URL(string: creatureDetail.imageURLString)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 8, x: 5, y: 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        }
                } placeholder: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.clear)
                }
                .frame(width: 96, height: 96)
                .padding(.trailing)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("Height")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text(String(format: "%.1f", creatureDetail.height))
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    HStack(alignment: .top) {
                        Text("Weight")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text(String(format: "%.1f", creatureDetail.weight))
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            Spacer()
        }
        .padding()
        .task {
            creatureDetail.urlString = creature.url  // url passed over in getDetail for CreatureDetail
            await creatureDetail.getData()
        }
    }
}

#Preview {
    DetailView(creature: Creature(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
}
