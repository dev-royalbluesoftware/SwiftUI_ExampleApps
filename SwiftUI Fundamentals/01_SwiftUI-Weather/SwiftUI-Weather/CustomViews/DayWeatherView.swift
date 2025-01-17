//
//
// SwiftUI-Weather
// WeatherButtonTitle.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct DayWeatherView: View {
    
    // MARK: - Properties
    
    var title: String
    var imageName: String
    
    var body: some View {
        HStack {
            Label(title, systemImage: imageName)
                .frame(width: 280, height: 50)
                .font(.system(size: 20, weight: .bold))
        }
    }
}

#Preview {
    DayWeatherView(title: "Test", imageName: "testtube.2")
}
