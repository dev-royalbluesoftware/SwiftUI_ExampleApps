//
//
// SwiftUI-AppleFrameworks
// FrameworkDetailView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct FrameworkDetailView: View {
    
    // MARK: - Properties
    
    var framework: Framework
    
    var body: some View {
        VStack {
            Spacer()
            
            FrameworkTitleView(frameWork: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                
            } label: {
                AFButtonWithImage(buttonTitle: "Learn More", systemImageName: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
