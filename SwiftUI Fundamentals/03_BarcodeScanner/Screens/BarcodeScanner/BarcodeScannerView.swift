//
//
// BarcodeScanner
// BarcodeScannerView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

struct BarcodeScannerView: View {
    
    // MARK: - State Properties
    
    @StateObject private var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedBarcode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.scannedBarcode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusMessageColor)
                    .padding()
            }
            .padding()
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
