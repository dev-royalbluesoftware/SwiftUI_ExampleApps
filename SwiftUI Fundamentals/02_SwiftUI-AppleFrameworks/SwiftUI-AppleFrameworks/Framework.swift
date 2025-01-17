//
//
// SwiftUI-AppleFrameworks
// Framework.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import Foundation

struct Framework: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let urlString: String
    let description: String
}
