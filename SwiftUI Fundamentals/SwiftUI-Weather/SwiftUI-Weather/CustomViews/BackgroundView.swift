//
//
// SwiftUI-Weather
// BackgroundView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct BackgroundView: View {
    
    // MARK: - Properties
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : .midnightBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
     // Default Swift Gradient
        /*
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
         */
    }
}
