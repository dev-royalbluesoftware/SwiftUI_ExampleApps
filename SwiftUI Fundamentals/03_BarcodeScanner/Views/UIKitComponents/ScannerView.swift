//
//
// BarcodeScanner
// ScannerView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // MARK: - Coordinator Class
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        // MARK: - Properties
    
        private let scannerView: ScannerView
        
        // MARK: - Initializers
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidCameraDevice:
                scannerView.alertItem = AlertContext.invalidDeviceInput
                
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}
