//
//  CameraViewModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import Foundation
import SwiftUI
import AVFoundation
import Combine
import Foundation
import AudioToolbox
import AVKit
import Photos

// MARK: CameraModel
class CameraViewModel: NSObject,ObservableObject,AVCapturePhotoCaptureDelegate,AVCaptureFileOutputRecordingDelegate {
 
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var isSaved = false
    @Published var picData = Data(count: 0)
 
    @Published var showMicActionSheet = false
    @Published var showFlashActionSheet = false
    @Published var selectedButtonIndex: Int? = nil
    @Published var isRotated = false
    @Published var flashMode: FlashMode = .on
    @Published var isHDRModeActive = false
    @Published var currentExposure: Float = 0.0
    @Published var isHDRSupported = false
    @Published var is4KSupported = false
    @Published var isRecording = false
    
    @Published var output2 = AVCaptureMovieFileOutput()
    @Published var previewURL: URL?
    @Published var showPreview: Bool = false
    @Published var recordedDuration: CGFloat = 0
    @Published var maxDuration: CGFloat = 20
    @Published var elapsedTime: Int = 0
    
    @Published var capturedImages: [UIImage] = []
    @Published var videos: [URL] = []
    @Published var recordedURLs: [URL] = []
    
    @Published var selectedVideoURL: URL?
    @Published var currentFPS: Int = 30
    @Published var isFocusing = false
    @Published var tapLocation: CGPoint? = nil
    @Published var isAutoFocusLocked = false
    @Published var xyz = false
    
    @Published var showImagePreview: Bool = false
    @Published var selectedImage: UIImage?
    
    enum FlashMode {
        case off
        case on
    }
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        
    }
    func setFlashMode(for settings: AVCapturePhotoSettings) {
        switch flashMode {
        case .off:
            settings.flashMode = .off
        case .on:
            settings.flashMode = .on
        }
    }

    func showYellowBox(at location: CGPoint) {
        tapLocation = location
    }
    
    func unlockAutoFocusAndExposure() {
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                try device.lockForConfiguration()
                isAutoFocusLocked = false
                // Unlock AF and AE
                if device.isFocusModeSupported(.continuousAutoFocus) {
                    device.focusMode = .continuousAutoFocus
                }
                if device.isExposureModeSupported(.continuousAutoExposure) {
                    device.exposureMode = .continuousAutoExposure
                }
                xyz = false
                device.unlockForConfiguration()
            } catch {
                print("Error unlocking AF and AE: \(error.localizedDescription)")
            }
        }
    }
    func focusCamera(at touchPoint: CGPoint) {
        guard let previewLayer = preview, let device = AVCaptureDevice.default(for: .video) else {
            print("Expected a previewLayer and device")
            return
        }
        
        let convertedPoint: CGPoint = previewLayer.captureDevicePointConverted(fromLayerPoint: touchPoint)
        print(convertedPoint)
        if device.isFocusPointOfInterestSupported && device.isFocusModeSupported(.autoFocus) && device.isExposurePointOfInterestSupported {
            do {
                try device.lockForConfiguration()
                device.focusPointOfInterest = convertedPoint
                device.focusMode = .autoFocus
                device.exposurePointOfInterest = convertedPoint
                device.exposureMode = .continuousAutoExposure
                device.unlockForConfiguration()
                
                isFocusing = true
            } catch {
                print("Unable to focus")
            }
        }

        
    }
    
    
    // MARK: Check
    func Check(){
        // first checking camerahas got permission..
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
            // Setting Up Session
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                
                if status{
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    // MARK: Set Up
    func setUp() {
        do {
            self.session.beginConfiguration()
            
            // Check for any available camera device
            if let device = AVCaptureDevice.default(for: .video) {
                
                let videoInput = try AVCaptureDeviceInput(device: device)
                if let audioDevice = AVCaptureDevice.default(for: .audio) {
                    let audioDeviceInput = try AVCaptureDeviceInput(device: audioDevice)
                    if  self.session.canAddInput(audioDeviceInput) {
                        self.session.addInput(audioDeviceInput)
                    }
                }
                
                
                if self.session.canAddInput(videoInput) {
                    self.session.addInput(videoInput)
                    
                }
                setAutoWhiteBalance()
                if self.session.canAddOutput(self.output) {
                    self.session.addOutput(self.output)
                }
                if self.session.canAddOutput(self.output2) {
                    self.session.addOutput(self.output2)
                }
                //setCameraFrameRate()
                self.session.commitConfiguration()
            } else {
                print("No camera device available.")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setAutoWhiteBalance() {
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                try device.lockForConfiguration()
                
                if device.isWhiteBalanceModeSupported(.continuousAutoWhiteBalance) {
                    device.whiteBalanceMode = .continuousAutoWhiteBalance
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Error setting auto white balance: \(error.localizedDescription)")
            }
        }
    }
    
    func flashEnableButtonAction() {
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            return
        }
        
        if captureDevice.hasTorch {
            do {
                let _: () = try captureDevice.lockForConfiguration()
            } catch {
                print("aaaa")
            }
            
            if captureDevice.isTorchActive {
                captureDevice.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                
                do {
                    let _ = try captureDevice.setTorchModeOn(level: 1.0)
                } catch {
                    print("bbb")
                }
            }
            
            captureDevice.unlockForConfiguration()
        }
    }
    
}
