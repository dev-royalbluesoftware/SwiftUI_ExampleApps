//
//
// SwiftUI-AppleFrameworks
// FrameworkGridViewModel.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
}
