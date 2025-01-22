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
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            FrameworkTitleView(frameWork: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButtonWithImage(buttonTitle: "Learn More", systemImageName: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
            .padding(.bottom, 40)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
