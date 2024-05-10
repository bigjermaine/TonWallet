//
//  SendDisplayCoinView.swift
//  TonWallet
//
//  Created by MacBook AIR on 05/05/2024.
//

import SwiftUI

struct SendDisplayCoinView: View {
    @Binding  var path: [AuthRoutes]
    var body: some View {
        VStack(spacing:20){
            Spacer()
            Image("tonWalletCreateWalletImage")
            HStack{
                Spacer()
                     Text("-246.8")
                    .font(.system(size:48))
                    .foregroundColor(.black)
                    .bold()
                Text("TON")
                    .bold()
                    .font(.system(size:30))
                    .foregroundStyle(.gray)
             
                
                Spacer()
            }
            Text("Coins have been sent!")
                .foregroundStyle(.gray)
            Text("Transaction Details")
                .foregroundStyle(.blue)
            Spacer()
            Button{
                path.removeAll()
            }label: {
                Text("Close")
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.blue)
            .cornerRadius(12)
            .padding(.top,15)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
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
    }
}

#Preview {
    SendDisplayCoinView(path: .constant([.SendDisplayCoinView]))
}
