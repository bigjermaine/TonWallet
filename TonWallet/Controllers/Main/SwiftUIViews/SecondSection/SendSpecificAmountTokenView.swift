//
//  SendSpecificAmountTokenView.swift
//  TonWallet
//
//  Created by MacBook AIR on 04/05/2024.
//

import SwiftUI
import UIKit
struct SendSpecificAmountTokenView: View {
    @State var text = ""
    @State var coinAmount = "120"
    @State var checkCoinAmountColor:Color = .black
    @State var continueBackgroundColor:Color = .blue
    @State var tonBalanceCheck:String = "Continue"
    @Binding  var path: [AuthRoutes]
    @State var showTotalAmountBool:Bool = false
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
            if showTotalAmountBool {
                availableUSD
            }
            Spacer()
            HStack{
                bottomView
                Spacer()
                useAllButton
            }
           
            Button{
                 HapticManager.shared.vibrateForSelection()
                    path.append(.SendTonFillDescriptionView)
                
            }label: {
                Text(tonBalanceCheck)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(continueBackgroundColor)
            .cornerRadius(12)
            .padding(.top,15)
            Spacer()
            Spacer()
        }
        .navigationTitle("Send NO")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                    path.removeAll()
                }label: {
                    Image("CloseButton")
                }
            }
        }
        .onChange(of:text) { x in
            if x.isEmpty {
                showTotalAmountBool = false
            }else {
                showTotalAmountBool = true
            }
            check1()
        }
        .padding()
      
    }
    func check1() {
        guard let x1 =  Int(text) else {return}
        guard let x2 = Int(coinAmount)  else {return}
        if  x1 > x2 {
            checkCoinAmountColor = .red
            tonBalanceCheck = "Insufficient TON Balance"
            continueBackgroundColor = .blue.opacity(0.3)
            HapticManager.shared.vibrate(for: .error)
        }else {
            checkCoinAmountColor = .black
            tonBalanceCheck =  "Continue"
            continueBackgroundColor = .blue
            HapticManager.shared.vibrate(for: .success)
            
        }
    }
    
    
}

#Preview {
    SendSpecificAmountTokenView(path: .constant([.SendSpecificAmountTokenView]))
}

extension SendSpecificAmountTokenView {
    var bottomView: some View {
        HStack{
            Image("toncoinIcon")
            VStack(alignment:.leading){
                Text("Toncoin")
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16))
                Text("\(coinAmount) TON")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }
        }
        
    }
    
    var useAllButton : some View {
        HStack{
            Button {
            text = "120"
            }label: {
                Text("Use All")
                    .bold()
                    .foregroundColor(.blue)
            }
             
        }
      
        .frame(width: 80,height: 32)
        .background(.blue.opacity(0.2))
        .cornerRadius(16, corners: .allCorners)
    }
    
    var availableUSD : some View {
            HStack(spacing:0){
                Text("120 USD")
                    .bold()
                    .foregroundStyle(.gray)
                Image("exchangeIcon")
                    .padding(4)
                
              }
            .frame(width: 150,height: 40)
            .cornerRadius(16, corners: .allCorners)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        
        
    
}
