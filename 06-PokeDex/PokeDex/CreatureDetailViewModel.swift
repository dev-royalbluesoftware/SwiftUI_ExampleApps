//
//
// PokeDex
// CreatureDetailViewModel.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//

import Foundation

@Observable // (Macro) will watch objects for changes so that SwiftUI will redraw the interface when needed.
class CreatureDetailViewModel: Codable {
    
    // MARK: - Struct Returned (to Decode JSON)
    
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprite
    }
    
    struct Sprite: Codable {
        var front_default: String
    }
    
    // MARK: - Properties
    
    var urlString = ""  // update with string passed in from creature clicked on
    var height = 0.0
    var weight = 0.0
    var imageURLString = ""
    
    // MARK: - Get Data Function
    
    func getData() async {
        print("🕸️, This is the expected url: \(urlString)" )
        
        // Create URL
        guard let url = URL(string: urlString) else {
            print("🚫, ERROR: Could not create URL from \(urlString)")
            return
        }
        
        // retrieve data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Try to decode the JSON data into our data structure
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("🚫, ERROR: Could not decode returned JSON data.")
                return
            }
            self.height = returned.height
            self.weight = returned.weight
            self.imageURLString = returned.sprites.front_default
            
        } catch {
            print("🚫, ERROR: Could not get data from \(urlString)")
        }
    }
}
