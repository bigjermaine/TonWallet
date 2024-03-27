//
//  RecentView.swift
//  TonWallet
//
//  Created by MacBook AIR on 27/03/2024.
//

import SwiftUI

struct RecentCoin: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("seedPhaseCellColor")
                .ignoresSafeArea()
            VStack{
                VStack(spacing:10){
                    
                    HStack{
                        Spacer()
                        VStack(alignment:.center){
                            Text("Recieved")
                                .bold()
                            Text("31 January at 8:40")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .padding(.leading,20)
                        .padding(.top,10)
                        Spacer()
                        Button{
                            dismiss()
                        }label: {
                            Image("CloseButton")
                                .frame(width: 20,height: 20)
                                .padding(.trailing,10)
                                
                        }
                       
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Text("+250 TON")
                                .font(.system(size: 34,weight: .bold))
                                .foregroundStyle(.green)
                            Text("$500")
                                .font(.system(size: 17,weight: .bold))
                                .foregroundStyle(.green)
                        }
                        Spacer()
                    }
                  
                }
                List{
                    Section(header: Text("Transaction Details")) {
                        
                        HStack{
                            Text("Sender")
                                .bold()
                            Spacer()
                            Text("Crypto Bot")
                                .bold()
                        }
                        HStack{
                            Text("Amount")
                                .bold()
                            Spacer()
                            Text("250 TON")
                                .bold()
                        }
                        HStack{
                            Text("Fee")
                                .bold()
                            Spacer()
                            Text("0.07 TON")
                                .bold()
                        }
                        
                        HStack{
                            Text("View in Explorer")
                                .foregroundStyle(.blue)
                            
                            
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    RecentCoin()
}
