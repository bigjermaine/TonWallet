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
    @State private var isCopied: Bool = false
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
                    HStack{
                        Text("Your TON Address")
                            .font(.system(size: 13))
                            .bold()
                            .padding(.leading,30)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    VStack{
                      
                            VStack{
                                Image("QR Code")
                                    .resizable()
                                    .frame(width: 252,height: 252)
                                
                                Text("UQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqEBI")
                                    .multilineTextAlignment(.center)
                                    
                                    .frame(width: 252,height: 50)
                                
                                HStack{
                                    Button{
                                        let address = "Your address here"
                                        UIPasteboard.general.string = address
                                        isCopied = true
                                    }label: {
                                        Text("Copy Address")
                                            .foregroundStyle(.blue)
                                            .bold()
                                    }
                                    .frame(width: 120,height:10)
                                    Spacer()
                                    ShareLink(item: URL(string: "UQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqEBI")!) {
                                        Label("Share QR Code", systemImage: "")
                                            .foregroundStyle(.blue)
                                            .bold()
                                    }
                                    
                                }
                                .padding()
                                
                               
                            
                        }
                            .padding()
                        
                    }
                    
                    
                    .background(Color.white)
                    .cornerRadius(12, corners: .allCorners)
                    .padding([.horizontal,.bottom])
                    .padding(.bottom,10)
                 
                    List{
                       
                        
                        Section(header: Text("Buy Crypto")){
                            Button{
                                path.append(.Buy)
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
            .alert("Copied To ClipBoard", isPresented: $isCopied) {
                    
                   }
            .navigationDestination(for: QRRoutes.self) { route in
                switch route {
                case.Buy:
                    BuyCardQRView(url:"https://ton.org/buy-toncoin?filters[exchange_groups][slug][$eq]=buy-with-card&pagination[page]=1&pagination[pageSize]=100", path: $path)
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

