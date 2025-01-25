//
//
// PokeDex
// Creatures.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import Foundation

@Observable // (Macro) will watch objects for changes so that SwiftUI will redraw the interface when needed.
class Creatures: Codable {
    
    // MARK: - Struct Returned (to Decode JSON)
    
    private struct Returned: Codable {
        var count: Int
        var next: String? // needs to be optional because last page (next = null)
        var results: [Creature]
    }
    
    // MARK: - Properties
    
    var urlString = "https://pokeapi.co/api/v2/pokemon"
    var count = 0
    var creaturesArray: [Creature] = []
    var isLoading = false
    
    // MARK: - Get Data Function
    
    func getData() async {
        print("🕸️, This is the expected url: \(urlString)" )
        isLoading = true
        
        // Create URL
        guard let url = URL(string: urlString) else {
            print("🚫, ERROR: Could not create URL from \(urlString)")
            isLoading = false
            return
        }
        
        // retrieve data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Try to decode the JSON data into our data structure
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("🚫, ERROR: Could not decode returned JSON data.")
                isLoading = false
                return
            }
            Task { @MainActor in
                self.count = returned.count
                self.urlString = returned.next ?? ""
                self.creaturesArray = self.creaturesArray + returned.results
                isLoading = false
            }
            
        } catch {
            print("🚫, ERROR: Could not get data from \(urlString)")
            isLoading = false
        }
    }
    
    // MARK: - Load All Function
    
    func loadAll() async {
        Task { @MainActor in
            guard urlString.hasPrefix("http") else { return }
            
            await getData() // get next page of data
            await loadAll() // call loadAll again - will stop when all pages are retrieved
        }
    }
}
