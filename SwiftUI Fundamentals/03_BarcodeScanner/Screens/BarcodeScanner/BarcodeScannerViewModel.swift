//
//
// BarcodeScanner
// BarcodeScannerViewModel.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    @Published var scannedBarcode = ""
    
    var statusMessage: String {
        scannedBarcode.isEmpty ? "Scan a barcode" : scannedBarcode
    }
    
    var statusMessageColor: Color {
        scannedBarcode.isEmpty ? .red : .green
    }
}
