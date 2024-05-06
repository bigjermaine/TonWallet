//
//  CameraView.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import Foundation
import SwiftUI
import AVFoundation
// MARK: CameraPreview
struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera : CameraViewModel
    @State private var isLongPressing = false
    @State private var isAutoFocusLocked = false
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                try device.lockForConfiguration()
                device.setExposureTargetBias(camera.currentExposure, completionHandler: nil)
                device.unlockForConfiguration()
            } catch {
                print("Error adjusting exposure: \(error)")
            }
        }
        
        // Draw a yellow box at the tapLocation
        if let tapLocation = camera.tapLocation {
            let boxLayer = CALayer()
            boxLayer.frame = CGRect(x: tapLocation.x - 25, y: tapLocation.y - 25, width: 70, height: 70)
            boxLayer.borderWidth = 2
            boxLayer.borderColor = UIColor.yellow.cgColor
            boxLayer.opacity = 1.0
            uiView.layer.addSublayer(boxLayer)
            
            // Reset tapLocation to nil after drawing the box
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.camera.tapLocation = nil
                boxLayer.opacity = 0.0
            }
        }
    }
  
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .blue
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer (camera.preview)
        
        camera.session.startRunning()
        
        
        return view
    }
}
