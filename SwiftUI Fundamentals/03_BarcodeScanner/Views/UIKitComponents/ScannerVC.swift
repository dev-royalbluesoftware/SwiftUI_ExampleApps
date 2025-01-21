//
//
// BarcodeScanner
// ScannerVC.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 


import UIKit
import AVFoundation

// MARK: - Error Enum

enum CameraError: String {
    case invalidCameraDevice
    case invalidScannedValue
}

// MARK: - Protocol ScannerVCDelegate

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
}

final class ScannerVC: UIViewController {
    
    // MARK: - Properties
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate?
    
    // MARK: - Initializers
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didSurface(error: .invalidCameraDevice)
            return
        }
        
        previewLayer.frame = view.layer.bounds
    }
    
    // MARK: - Setup Functions
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            scannerDelegate?.didSurface(error: .invalidCameraDevice)
            return
        }
        
        // input
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            scannerDelegate?.didSurface(error: .invalidCameraDevice)
            return
        }
        
        // metaData Output
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13, .upce]
            
        } else {
            scannerDelegate?.didSurface(error: .invalidCameraDevice)
            return
        }
        
        // previewLayer
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill  //force unwrap because set immediately above
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

// MARK: - AVCaptureMetadataOutputObjects Delegate

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    // what to do with barcode
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        guard let machineReadableObject = metadataObject as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        guard let barcodeStringValue = machineReadableObject.stringValue else {
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        scannerDelegate?.didFind(barcode: barcodeStringValue)
    }
}
