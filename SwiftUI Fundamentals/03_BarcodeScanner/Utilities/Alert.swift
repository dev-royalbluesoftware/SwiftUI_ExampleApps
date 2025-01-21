//
//
// BarcodeScanner
// Alert.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

// MARK: - Alert Item

struct AlertItem: Identifiable {
    var id = UUID()
    var title: String
    var message: String
    let dismissButton: Alert.Button 
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input", message: "Something is wrong with the camera.  We are unable to capture the input.", dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type", message: "The value scanned is not valid.  This app scans EAN-8, EAN-13, and UPC.", dismissButton: .default(Text("OK")))
    
}
