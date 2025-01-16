//
//
// SwiftUI-Weather
// CityTextView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct CityTextView: View {
    
    // MARK: - Properties
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}
