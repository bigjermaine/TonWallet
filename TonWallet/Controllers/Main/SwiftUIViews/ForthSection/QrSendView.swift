//
//  QrSendView.swift
//  TonWallet
//
//  Created by MacBook AIR on 07/05/2024.
//

import SwiftUI

struct QrSendView: View {
    @State  var path: [QRRoutes] = []
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color.lightWhite.ignoresSafeArea()
                VStack{
                HStack{
                    Spacer()
                    Text("Add Crypto")
                        .bold()
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                        path.removeAll()
                        dismiss()
                    }label: {
                        Image("CloseButton")
                    }
                    
                }
                .padding()
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
                                path.append(.BuyWithCrypto)
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
    QrSendView()
}


extension QrSendView {
    
}

enum QRRoutes: Hashable {
    case Password
    case Buy
    case Scan
    case BuyWithCrypto
    case sellAsset
    case BuyAsset
}

