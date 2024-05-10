//
//  QrSwapView.swift
//  TonWallet
//
//  Created by MacBook AIR on 07/05/2024.
//

import SwiftUI

struct QrSwapView: View {
    @Binding  var path: [QRRoutes]
    @State var text = ""
    @State var coinAmount = "12345"
    @State var checkCoinAmountColor:Color = .black
    @State var tonBalanceCheck:String = "Enter Amounts"
    @State var continueBackgroundColor:Color = .blue
    @Environment(\.dismiss) var dismiss
    @State var shown = false
    @State var isSuccess = false
    @State var message = ""
    @State var c: AlertAction?
    @ObservedObject var vm = BuySellViewModel()
    var body: some View {
        ZStack {
            Color("seedPhaseCellColor")
                .ignoresSafeArea()
            VStack{
                firstSection
                privacy
                Spacer()
                Button{
                   
                    path.append(.Password)
                    
                }label: {
                    Text("Continue")
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(continueBackgroundColor)
                .cornerRadius(10)
                .padding(.top,15)
                .padding()
               
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Swap")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                
                
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    dismiss()
                }label: {
                    Image("CloseButton")
                        .frame(width: 20,height: 20)
                        .padding(.trailing,26)
                    
                    
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                }label: {
                    Image("X")
                        .frame(width: 20,height: 20)
                        .padding(.leading,26)
                        
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    
    }
}

#Preview {
    QrSwapView(path: .constant([.Scan]))
}

extension QrSwapView {
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
                        path.append(.BuyAsset)
                    }label: {
                        HStack{
                            Image("sellTetherIcon")
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text("USDT TRC20")
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                            Image(systemName: "chevron.right")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 6 ,height: 10)
                            
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
                    Text(vm.selectedData.rate)
                        .foregroundStyle(.gray)
                    
                }
                .font(.system(size: 14))
                
                HStack{
                    Button{
                        path.append(.BuyAsset)
                    }label: {
                        HStack{
                            Image(vm.selectedData.imageCoin)
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text(vm.selectedData.nameCoin)
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                            Image(systemName: "chevron.right")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 6 ,height: 10)
                            
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
    var privacy: some View {
        VStack (alignment: .leading){
              Text("Cross-chain exchange by Changelly")
                .foregroundColor(.gray)
                .font(.system(size: 13))
                .bold()
            HStack(spacing:0){
              
              Text("By continuing")
                    .font(.system(size: 13))
                  .foregroundColor(.gray)
                  .multilineTextAlignment(.leading)
              
          
                Button(action: {
                    // Action when Terms of Use button is clicked
                }) {
                    Text(" terms of use")
                        .foregroundColor(.blue)
                      
                        .font(.system(size: 13))
                }
                
                Text(" and ")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
                NavigationLink(destination: BrowserView(url: URL(string: "https://tonkeeper.com/privacy")!)) {
                    Text("privacy policy")
                        .foregroundColor(.blue)
                        .font(.system(size: 13))
                        
                }
            }
            Text("and understand that the transaction may trigger")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            HStack {
            Text("verification according to")
                    .font(.system(size: 13))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                
                NavigationLink(destination: BrowserView(url: URL(string: "https://docs.ton.org/develop/dapps/ton-connect/security")!)) {
                    Text("Changelly AML/KYC")
                        .foregroundColor(.blue)
                        .font(.system(size: 13))
                        
                    
                  }
                
              
                  
                  
              }
              
              
             
          }
           .padding(.trailing,40)
           .padding(.top,10)
          
      }
        
}


