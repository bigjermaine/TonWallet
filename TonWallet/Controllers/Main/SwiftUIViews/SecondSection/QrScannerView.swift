//
//  QrScannerView.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import SwiftUI
import SwiftUI
import AVFoundation

import SwiftUI
import AVFoundation

struct QRScannerView: View {
    @State private var isScannerActive: Bool = false
    @State private var scannedCode: String?
    @State private var isLightOn: Bool = false
    
    var body: some View {
        ZStack {
            ScannerView(scannedCode: $scannedCode, isScannerActive: $isScannerActive, isLightOn: $isLightOn)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Button(action: {
                    self.isLightOn.toggle()
                }) {
                    Text(isLightOn ? "Turn Off Light" : "Turn On Light")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
            }
        }
    }
}

struct ScannerView: View {
    @Binding var scannedCode: String?
    @Binding var isScannerActive: Bool
    @Binding var isLightOn: Bool
    
    var body: some View {
        ZStack {
            ScannerViewController(scannedCode: $scannedCode, isScannerActive: $isScannerActive, isLightOn: $isLightOn)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ScannerViewController: UIViewControllerRepresentable {
    @Binding var scannedCode: String?
    @Binding var isScannerActive: Bool
    @Binding var isLightOn: Bool
    
    func makeUIViewController(context: Context) -> ScannerVC {
        let scannerViewController = ScannerVC()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        var parent: ScannerViewController
        
        init(parent: ScannerViewController) {
            self.parent = parent
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                guard let stringValue = readableObject.stringValue else { return }
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                self.parent.scannedCode = stringValue
            }
        }
    }
}

class ScannerVC: UIViewController {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    weak var delegate: AVCaptureMetadataOutputObjectsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
    }
    
    func failed() {
        let alertController = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
}
