//
//
// SwiftUI-Weather
// ContentView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 58 : 74)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 77)
                    
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 75)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 32)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.haze.fill", temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 55)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                    
                } label: {
                    DayWeatherView(title: "Change Time of Day", imageName: "sunset.fill")
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
                .tint(.indigo)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
