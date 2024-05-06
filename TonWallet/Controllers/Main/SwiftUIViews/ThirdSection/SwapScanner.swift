//
//  SwapScanner.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import SwiftUI

struct SwapScanner: View {
        
        
        @State private var vm: CameraViewModel = CameraViewModel()
        @Environment(\.scenePhase) private var scenePhase
        @Binding  var path: [SwapRoutes]
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

   

#Preview {
    SwapScanner(path: .constant([.Scan]))
}
