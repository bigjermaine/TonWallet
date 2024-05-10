//
//  AddStakeView.swift
//  TonWallet
//
//  Created by MacBook AIR on 08/05/2024.
//

import SwiftUI

struct AddStakeView: View {
    @State var text = ""
    @State var coinAmount = "12000"
    @State var checkCoinAmountColor:Color = .black
    @State var continueBackgroundColor:Color = .blue
    @State var tonBalanceCheck:String = "Stake TON"
    @State var showTotalAmountBool:Bool = false
    @State var estimatedBalance =   "Est. balance in a year ≈ 0 TON"
    @Binding  var path: [StakeRoutes]
    var body: some View {
        VStack(alignment:.center){
            Spacer()
            HStack{
                Spacer()
                TextField("", text: $text)
                    .keyboardType(.numberPad)
                    .font(.system(size:48))
                    .frame(width: 130)
                    .foregroundColor(checkCoinAmountColor)
                Text("TON")
                    .font(.system(size:30))
                    .foregroundStyle(.gray)
                Spacer()
            }
          
            availableUSD
            Spacer()
            HStack{
                bottomView
                Spacer()
                useAllButton
            }
            Spacer()
            Spacer()
            Button{
                HapticManager.shared.vibrateForSelection()
                path.append(.confirmPassword)
            }label: {
                Text(tonBalanceCheck)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(continueBackgroundColor)
            .cornerRadius(12)
            .padding(.top,15)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                     path.removeAll()
                }label: {
                    Image("CloseButton")
                }
                
                
            }
            
            ToolbarItem(placement: .principal) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                   // path.removeAll()
                }label: {
                    Text("Add Stake")
                        .foregroundStyle(.black)
                        .bold()
                }
                
                
            }
        }
            
    }
    func check1() {
        guard let x1 =  Int(text) else {return}
        guard let x2 = Int(coinAmount)  else {return}
        if  x1 > x2 {
            checkCoinAmountColor = .red
            tonBalanceCheck = "Insufficient TON Balance"
            continueBackgroundColor = .blue.opacity(0.3)
            HapticManager.shared.vibrate(for: .warning)
            estimatedBalance =  "Est. balance in a year ≈ 0 TON"
            
            estimatedBalance = "Est. balance in a year ≈ 8 910 TON"
            
        }else if x1 > 0 {
            
        }else  {
            HapticManager.shared.vibrate(for: .success)
            checkCoinAmountColor = .black
            tonBalanceCheck =  "Stake TON"
            continueBackgroundColor = .blue
        }
    }
}

#Preview {
    AddStakeView(path:.constant([.addStake]))
}

extension AddStakeView {
    
    var bottomView: some View {
        HStack{
            Image("toncoinIcon")
            VStack(alignment:.leading){
                Text("Toncoin")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                Text("\(coinAmount) TON")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }
        }
        
    }
    
    var useAllButton : some View {
        HStack{
            Button {
                text = "12000"
            }label: {
                Text("Use All")
                    .bold()
                    .foregroundColor(.blue)
            }
            .frame(width: 80,height: 32)
            .background(.blue.opacity(0.2))
            .cornerRadius(16, corners: .allCorners)
        }
       
    }
             
    var availableUSD : some View {
        HStack(spacing:0){
            Text(estimatedBalance)
                .font(.system(size: 17))
                .bold()
                .foregroundStyle(.gray)
          
            
        }
        .frame(width: 260,height: 30)
        .background(.gray.opacity(0.1))
        .cornerRadius(32, corners: .allCorners)
        
    }
    
}
