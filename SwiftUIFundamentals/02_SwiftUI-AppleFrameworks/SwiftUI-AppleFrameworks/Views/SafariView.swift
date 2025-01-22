//
//
// SwiftUI-AppleFrameworks
// SafariView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    let url: URL
    
    // MARK: - Helper Functions
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
