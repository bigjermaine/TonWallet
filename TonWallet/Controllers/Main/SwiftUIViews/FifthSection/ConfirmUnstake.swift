//
//  ConfirmUnstake.swift
//  TonWallet
//
//  Created by MacBook AIR on 08/05/2024.
//

import SwiftUI

struct ConfirmUnstake: View {
    @State private var enteredNumbers: [String] = Array(repeating: "", count: 4)
    @State private var password: String = ""
    @Binding  var path: [StakeRoutes]
    @EnvironmentObject var stakeViewModel:StakeViewModel
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10) {
                VStack{
                    Text("Confirm Unstake")
                        .font(.system(size: 20))
                    Text("7325 TON")
                        .foregroundStyle(.gray)
                }
                  
            }
            if password.count ==  4 {
                withAnimation(.easeIn) {
                    ZStack{
                        ProgressView()
                        HStack{}
                            .frame(width: 20, height: 40)
                            .padding(.bottom,40)
        
                      
                    }
                }
            }else {
                withAnimation(.easeInOut) {
                    PasswordView(enteredNumbers: enteredNumbers)
                        .padding(.bottom,40)
                }
            }
           
              
                   VStack(spacing: 20) {
                       HStack(spacing: 20) {
                           NumberButton(number: "1", letters: "", action: { self.enteredNumber(number: "1") })
                           NumberButton(number: "2", letters: "ABC", action: { self.enteredNumber(number: "2") })
                           NumberButton(number: "3", letters: "DEF", action: { self.enteredNumber(number: "3") })
                       }
                       
                       HStack(spacing: 20) {
                           NumberButton(number: "4", letters: "GHI", action: { self.enteredNumber(number: "4") })
                           NumberButton(number: "5", letters: "JKL", action: { self.enteredNumber(number: "5") })
                           NumberButton(number: "6", letters: "MNO", action: { self.enteredNumber(number: "6") })
                       }
                       
                       HStack(spacing: 20) {
                           NumberButton(number: "7", letters: "PQRS", action: { self.enteredNumber(number: "7") })
                           NumberButton(number: "8", letters: "TUV", action: { self.enteredNumber(number: "8") })
                           NumberButton(number: "9", letters: "WXYZ", action: { self.enteredNumber(number: "9") })
                       }
                       
                       HStack(spacing: 20) {
                           
                           ScanButton(action: self.scan)
                           NumberButton(number: "0", letters: "", action: { self.enteredNumber(number: "0") })
                           ClearButton(action: self.clearLast)
                       }
                   }
                   .padding(.horizontal)
              Spacer()
               }
         .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                  //  path.removeLast()
                }label: {
                    Image("CloseButton")
                }
            }
        }
            .padding()
           .padding(.top,40)
           .onChange(of: password) { x in
               if password.count ==  4 {
                   DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                       stakeViewModel.dataSwitch()
                       path.append(.earn)
                   }
                
               }
           }
           }
           
           func enteredNumber(number: String) {
               HapticManager.shared.vibrate(for: .success)
               if let emptyIndex = enteredNumbers.firstIndex(where: { $0.isEmpty }) {
                   enteredNumbers[emptyIndex] = number
                   password = enteredNumbers.joined()
               }
           }
           
           func clearLast() {
               HapticManager.shared.vibrate(for: .warning)
               if let lastIndex = enteredNumbers.lastIndex(where: { !$0.isEmpty }) {
                   enteredNumbers[lastIndex] = ""
                   password = enteredNumbers.joined()
               }
           }
    
    func scan() {
        HapticManager.shared.vibrate(for: .warning)
         path.append(.qrScanner)
       
    }
    }



#Preview {
    ConfirmUnstake(path: .constant([.confirmUnstakePassword]))
}





struct ScannerView1: View {
    
    
    @State private var vm: CameraViewModel = CameraViewModel()
    @Environment(\.scenePhase) private var scenePhase
    @Binding  var path: [StakeRoutes]
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



struct ScannerView2: View {
    
    
    @State private var vm: CameraViewModel = CameraViewModel()
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        QRScannerView()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                        
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
