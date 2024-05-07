//
//  CrossChainQrSwap.swift
//  TonWallet
//
//  Created by MacBook AIR on 07/05/2024.
//

import SwiftUI

struct CrossChainQrSwap: View {
    @State var text = ""
    @State var coinAmount = "12345"
    @State var checkCoinAmountColor:Color = .black
    @State var tonBalanceCheck:String = "Enter Receiving Address"
    @State var continueBackgroundColor:Color = .blue.opacity(0.3)
    @Environment(\.dismiss) var dismiss
    @State var shown = true
    @State  var path: [QRRoutes] = []
    @ObservedObject var vm = BuySellViewModel()

    var body: some View {
        NavigationStack(path:$path){
            ZStack {
                Color("seedPhaseCellColor")
                    .ignoresSafeArea()
                VStack{
                    firstSection
                    secondSection
                    Spacer()
                    Button{
                        path.append(.Password)
                    }label: {
                        Text(tonBalanceCheck)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(continueBackgroundColor)
                    .cornerRadius(10)
                    .padding(.top,15)
                    .padding()
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Swap")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        dismiss()
                    }label: {
                        Image("CloseButton")
                            .frame(width: 20,height: 20)
                            .padding()
                        
                    }
                }
                
                
            }
            .onChange(of: text) { x in
                if text.isEmpty {
                    shown = false
                    continueBackgroundColor = Color.blue.opacity(0.3)
                    tonBalanceCheck = "Enter Receiving Address"
                }else {
                    shown = true
                    continueBackgroundColor = Color.blue
                    tonBalanceCheck = "Swap TON to USDT"
                }
            }
            .navigationDestination(for: QRRoutes.self) { route in
                switch route {
                case.Buy:
                    BuyCardQRView(path: $path)
                case.Scan:
                    QrConfirmSwapView(path: $path)
                case.Password:
                    QrConfirmSwapView(path: $path)
                case.BuyWithCrypto:
                    QrSwapView(path:$path)
                case.sellAsset:
                    QrWaitingPaymentView(path:$path)
                case .BuyAsset:
                   EmptyView()
                }
            }
        }
        
    
    }
    }


#Preview {
    CrossChainQrSwap()
}

extension CrossChainQrSwap {
    var firstSection: some View {
        VStack {
            VStack{
                
                HStack{
                    Text("You Sell")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                .font(.system(size: 14))
                
                HStack{
                    Button{
                      //  path.append(.Sell)
                    }label: {
                        HStack{
                            Image("toncoinIcon")
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text("TON")
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                          
                        }
                    }
                    Spacer()
                    TextField("0", text: $text)
                        .keyboardType(.numberPad)
                        .bold()
                        .frame(width: 110)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(checkCoinAmountColor)
                }
                
            }
            
            .padding()
            ZStack{
                Divider()
                Image("convertIcon")
            }
            VStack{
                HStack{
                    Text("You Buy")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    Text("USDT ≈ 0.25 TON")
                        .foregroundStyle(.gray)
                    
                }
                .font(.system(size: 14))
                
                HStack{
                    Button{
                       // path.append(.Buy)
                    }label: {
                        HStack{
                            Image("jUSDTIcon")
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text("USDT TRC20")
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                         
                            
                        }
                    }
                    Spacer()
                    TextField("0", text: $text)
                        .keyboardType(.numberPad)
                        .bold()
                        .frame(width: 110)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.bottom)
            .padding(.horizontal)
            
        }
        .background(Color.white)
        .cornerRadius(8, corners: .allCorners)
        .padding(.horizontal)
        
    }
    
    var secondSection: some View {
        VStack(alignment:.leading){
            Text("Receive to")
                .foregroundStyle(.gray)
                .font(.subheadline)
                .padding(.leading,10)
            HStack{
                TextField("Enter TRON address", text: $text)
                    .padding(.horizontal)
                if shown {
                    Text("Paste")
                        .foregroundColor(.blue)
                    Image("Scan")
                        .foregroundStyle(.blue)
                        .foregroundColor(.blue)
                        .padding(.trailing)
                }
                
            }
            .frame(height: 44)
            .background(Color.white)
           
            .cornerRadius(12, corners: .allCorners)
            
            Text("Please provide an address of your wallet in another blockchain to receive bought tokens.")
                
                .foregroundStyle(.gray)
                .font(.caption)
                .padding(.leading,10)
        }
        .padding()
        
    }
    
}
