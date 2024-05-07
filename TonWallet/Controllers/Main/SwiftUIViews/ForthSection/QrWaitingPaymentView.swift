//
//  QrWaitingPaymentView.swift
//  TonWallet
//
//  Created by MacBook AIR on 07/05/2024.
//

import SwiftUI

struct QrWaitingPaymentView: View {
    @State var text = "-100"
    @State var text1 = "+25"
    @State var coinAmount = "12345"
    @State var checkCoinAmountColor:Color = .black
    @State var tonBalanceCheck:String = "Enter Amounts"
    @State var continueBackgroundColor:Color = .blue
    @Environment(\.dismiss) var dismiss
    @State var shown = false
    @State var showToggle = true
    @State var isSuccess = false
    @State var message = ""
    @State var c: AlertAction?
   @Binding  var path: [QRRoutes ]
    @ObservedObject var vm = BuySellViewModel()
    var body: some View {
   
            ZStack{
                Color("seedPhaseCellColor")
                    .ignoresSafeArea()
                VStack{
                    firstSection
                    showQRCode
                        .padding(.top,10)
                    privacy
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                        path.removeAll()
                    }label: {
                        Image("CloseButton")
                    }
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
          
//        }
//        .background( Color("seedPhaseCellColor"))
    }
}

#Preview {
    QrWaitingPaymentView(path: .constant([.sellAsset]))
}

extension QrWaitingPaymentView {
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
                            Image("sellTetherIcon")
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
                    Text("TON ≈ 4 USDT")
                        .foregroundStyle(.gray)
                    
                }
                .font(.system(size: 14))
                
                HStack{
                    Button{
                        path.append(.Buy)
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
                    TextField("0", text: $text1)
                        .keyboardType(.numberPad)
                        .foregroundColor(.green)
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
        VStack(alignment:.leading,spacing: 10){
            VStack{
                Text("Send")
                    .font(.system(size: 13))
                    .foregroundColor(.gray) +
                Text(" 100 USDT")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .bold() +
                Text(" to this address in ")
                    .font(.system(size: 13))
                    .foregroundColor(.gray) +
                Text(" TRON ")
                    .bold()
                    .font(.system(size: 13))
                    .foregroundColor(.gray) +
                Text(" blockchain within")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                +
                
                Text(" 19:37.")
                    .font(.system(size: 13))
                    .bold()
                    .foregroundColor(.gray)
               
            }
            
            Text(" Please note that it may take up to a few hours for tokens to appear in your wallet.")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            VStack{
                Text(" If there are any problems, please contact support at")
                    .foregroundColor(.gray)
                    .font(.system(size: 13)) +
                Text(" Changelly AML/KYC")
                    .font(.system(size: 13))
                    .foregroundColor(.blue) +
                Text(" or")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                
                +
                Text(" support@changelly.org ")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                
                +
                Text(" and")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                +
                Text(" provide your")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                +
                
                Text(" Transaction ID:")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            
            VStack{
                Text("datt12asdsgha34gkd")
                    .bold()
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            
        }
    }
                            
          
      
    
    var showQRCode:some View {
        VStack(spacing:0){
            HStack(spacing:40){
                Text("Send USDT TO THIS ADDRESS")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                Spacer()
                Button{
                    showToggle.toggle()
                }label: {
                    Text(!showToggle ? "Show QR" :"Hide QR" )
                        .font(.system(size: 13))
                }
            }
            .padding(.horizontal,8)
            if !showToggle {
                HStack{
                    Text("UQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqEBI")
                        .font(.system(size: 16))
                        .padding(.horizontal)
                }
                .frame(height:66)
                .background(.white)
                .cornerRadius(8)
                .padding(.vertical,6)
              
            }else{
                VStack{
                    Image("QR Code")
                        .resizable()
                        .frame(width: 250,height: 250)
                        .padding(.top,10)
                        
                    Text("UQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqEBI")
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                        .padding(.bottom,50)
                    
                }
                .frame(maxWidth:.infinity)
                .background(Color.white)
               
                .cornerRadius(12, corners: .allCorners)
                .padding()
               
               
                
            }
        }
        .padding(.horizontal)
    }
        
}


