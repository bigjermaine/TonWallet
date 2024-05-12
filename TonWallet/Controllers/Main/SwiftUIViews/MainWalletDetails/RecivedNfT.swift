//
//  RecivedNfT.swift
//  TonWallet
//
//  Created by MacBook AIR on 27/03/2024.
//

import SwiftUI

struct RecivedNfT: View {
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
                            Text("Sent NFT")
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
                                .padding(.trailing,20)
                            
                        }
                        
                    }
                    VStack(spacing:0){
                            Image("catImage1")
                            .resizable()
                            .frame(width:.infinity,height: 358)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                            .padding(.horizontal,20)
                        ZStack{
                            Rectangle()
                                .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                                .frame(width:.infinity,height: 82)
                                .foregroundColor(.white)
                                .padding(.horizontal,20)
                            
                            VStack(alignment:.leading){
                                HStack{
                                    VStack(alignment:.leading){
                                        Text("Cat #918")
                                            .font(.system(size: 24))
                                            .bold()
                                        HStack{
                                            Image("catSmallerIcon")
                                                .resizable()
                                                .frame(width:20,height: 20)
                                           Text("Rich Cats")
                                                .font(.system(size: 16))
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    Spacer()
                                }
                                .padding(.leading,30)
                                .padding()
                               
                                Spacer()
                                
                            }
                           
                        }
                       
                      
                         }
                    
                    List{
                        Section(header: Text("Transaction Details")) {
                            
                            HStack{
                                Text("Recipient")
                                    .bold()
                                Spacer()
                                Text("alice.ton")
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
}

#Preview {
    RecivedNfT()
}




struct RecivedNfT2: View {
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
                            Text("Recieved NFT")
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
                                .padding(.trailing,20)
                            
                        }
                        
                    }
                    VStack(spacing:0){
                            Image("marioCoinIcon")
                            .resizable()
                            .frame(width:.infinity,height: 358)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                            .padding(.horizontal,20)
                        ZStack{
                            Rectangle()
                                .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                                .frame(width:.infinity,height: 82)
                                .foregroundColor(.white)
                                .padding(.horizontal,20)
                            
                            VStack(alignment:.leading){
                                HStack{
                                    VStack(alignment:.leading){
                                        Text("Dave")
                                            .font(.system(size: 24))
                                            .bold()
                                        HStack{
                                         
                                           Text("Standalone NFT")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 16))
                                        }
                                    }
                                    Spacer()
                                }
                                .padding(.leading,30)
                                .padding()
                               
                                Spacer()
                                
                            }
                           
                        }
                       
                      
                         }
                    
                    List{
                        Section(header: Text("Transaction Details")) {
                            
                            HStack{
                                Text("Recipient")
                                    .bold()
                                Spacer()
                                Text("mario.t.me")
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
}
