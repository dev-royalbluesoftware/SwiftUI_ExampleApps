//
//
// SwiftUI-AppleFrameworks
// FrameworkTitleView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import SwiftUI

struct FrameworkTitleView: View {
    
    // MARK: - Properties
    
    let frameWork: Framework
    
    var body: some View {
        VStack {
            Image(frameWork.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            
            
            Text(frameWork.name)
                .font(.title2).fontWeight(.semibold)
                .foregroundStyle(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
