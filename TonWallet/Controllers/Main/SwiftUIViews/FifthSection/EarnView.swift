//
//  EarnView.swift
//  TonWallet
//
//  Created by MacBook AIR on 08/05/2024.
//

import SwiftUI

struct EarnView: View {
    @State var shown = true
    @State var isSuccess = false
    @State var message = ""
    @State var c: AlertAction?
    @Environment(\.dismiss) var dismiss
    @State var path:[StakeRoutes] = []
    @StateObject var stakeViewModel = StakeViewModel()
    var body: some View {
        NavigationStack(path:$path){
            ZStack{
                Color.lightWhite.ignoresSafeArea()
                VStack{
                    HStack{
                        Text("0")
                            .bold()
                            .font(.system(size: 48))
                        
                        Text("TON")
                            .font(.system(size: 32))
                            .bold()
                            .foregroundStyle(.gray)
                    }
                    Text("Your staking balance")
                        .foregroundStyle(.gray)
                    
                    Button{
                        HapticManager.shared.vibrateForSelection()
                        path.append(.addStake)
                        
                    }label: {
                        Text("Add Stake")
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(.top,15)
                    .padding()
                    Spacer()
                    VStack(spacing:20){
                        Image("earnAnimateIcon")
                        Text("Earn from your tokens while holding them")
                            .frame(width: 200)
                            .multilineTextAlignment(.center)
                            .bold()
                        Text("Estimated APY 3.51%")
                            .foregroundStyle(.gray)
                        Button{
                            shown = true
                        }label: {
                            Text("Why This is Safe")
                                .bold()
                        }
                    }
                    Spacer()
                    
                    
                }
                if shown {
                    AlertView2(shown: $shown, closureA: $c, isSuccess: isSuccess, message: message)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                       path.removeAll()
                        dismiss()
                    }label: {
                        Image("CloseButton")
                    }
                    
                    
                }
                
                ToolbarItem(placement: .principal) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                       path.removeAll()
                    }label: {
                        Text("Earn")
                            .foregroundStyle(.black)
                            .bold()
                    }
                    
                    
                }
                
            }
            .navigationDestination(for: StakeRoutes.self) { route in
                switch route {
                case.addStake:
                    AddStakeView(path: $path)
                case .confirmPassword:
                    ConfirmStakeView(path: $path)
                case .earn:
                    EarnDetailsView(path: $path)
                        .environmentObject(stakeViewModel)
                case .unstake:
                    UnstakeView(path:$path)
                case .confirmUnstakePassword:
                    ConfirmUnstake(path: $path)
                        .environmentObject(stakeViewModel)
                case .qrScanner:
                    ScannerView1(path: $path)
                }
            }
        }
       
       
    }
        
    
}

#Preview {
    EarnView()
}




enum StakeRoutes: Hashable {
    case addStake
    case confirmPassword
    case earn
    case unstake
    case confirmUnstakePassword
    case qrScanner
   
 
}


