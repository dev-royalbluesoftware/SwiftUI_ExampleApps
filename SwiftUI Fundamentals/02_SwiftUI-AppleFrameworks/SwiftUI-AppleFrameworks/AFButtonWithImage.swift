//
//
// SwiftUI-AppleFrameworks
// AFButtonWithImage.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct AFButtonWithImage: View {
    
    // MARK: - Properties
    
    var buttonTitle: String?
    var systemImageName: String?
    
    
    var body: some View {
            Label(buttonTitle ?? "Button Title", systemImage: systemImageName ?? "book.fill")
                .font(.title2).fontWeight(.semibold)
                .frame(width: 250, height: 50)
    }
}

#Preview {
    AFButtonWithImage()
}
