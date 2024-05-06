//
//  QrSendView.swift
//  TonWallet
//
//  Created by MacBook AIR on 07/05/2024.
//

import SwiftUI

struct QrSendView: View {
    var body: some View {
        ZStack{
            Color.lightWhite.ignoresSafeArea()
            List{
                Section(header: Text("Your TON Address")){
                    VStack{
                        Image("QR Code")
                            .resizable()
                        Text("UQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqEBI")
                            .multilineTextAlignment(.center)
                            .frame(width: 252)
                        
                        HStack{
                            Button{
                                
                            }label: {
                                Text("Copy Address")
                                    .foregroundStyle(.blue)
                            }
                            Spacer()
                            Button{
                                
                            }label: {
                                Text("Share QR Code")
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding()
                        .padding(.bottom,50)
                    }
                }
                
                Section(header: Text("Buy Crypto")){
                    Button{
                        
                    }label: {
                        HStack{
                            Image("cardImage")
                            Text("Buy with Card")
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    Button{
                        
                    }label: {
                        
                        HStack{
                            Image("buyCoinImage")
                            Text("Buy with Crypto")
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    QrSendView()
}


extension QrSendView {
    
}
