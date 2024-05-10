//
//  QrScannerView.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import SwiftUI
import SwiftUI
import AVFoundation





struct ScannerView: View {
    @State private var vm: CameraViewModel = CameraViewModel()
    @Environment(\.scenePhase) private var scenePhase
    @Binding  var path: [AuthRoutes]
    var body: some View {
        QRScannerView()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                        path.removeLast()
                    }label: {
                        Image("darkCloseButton")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Scan QR Code")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
        
            .environmentObject(vm)
        
        
    }
    
}
struct QRScannerView: View {
    @State private var isScannerActive: Bool = false
    @State private var scannedCode: String?
    @State private var isLightOn: Bool = false
    @EnvironmentObject var camera: CameraViewModel
    @State private var showTextOverlay: Bool = false

    var body: some View {
        ZStack {
            CameraPreview(camera: camera)
                .ignoresSafeArea (.all, edges: .all)
                .onTapGesture { location in
                    camera.focusCamera(at: location)
                    camera.unlockAutoFocusAndExposure()
                    camera.showYellowBox(at: location)
                }
            
            VStack(spacing:40){
                Image("focusImage")
                Button(action: {
                    camera.flashEnableButtonAction()
                    switch camera.flashMode {
                    case .off:
                        camera.flashMode = .on
                        isLightOn = true
                        showTextOverlay =  false
                        dismissTextOverlayAfterDelay()
                    case .on:
                        camera.flashMode = .off
                        isLightOn = false
                        showTextOverlay = true
                    }
                }) {
                    Image(flashImageName(for: camera.flashMode))
                        .resizable()
                        .frame(width:75, height: 75)
                        .foregroundColor(.red)
                }
                .padding(.horizontal, 6)
            }
            .navigationBarBackButtonHidden(true)

            if showTextOverlay {
                Text("Touch is on")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            camera.Check()
        }
    }
    
    func flashImageName(for mode: CameraViewModel.FlashMode) -> String {
        switch mode {
        case .off:
            return "touchIcon"
        case .on:
            return "touchIcon"
        }
    }

    func dismissTextOverlayAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            showTextOverlay = false
        }
    }
}
