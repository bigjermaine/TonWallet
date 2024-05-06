//
//  SearchCoinCell.swift
//  TonWallet
//
//  Created by MacBook AIR on 04/05/2024.
//

import SwiftUI

struct SearchCoinCell: View {
    var searchModel:SearchModel
    var body: some View {
        HStack{
            Image(searchModel.coinImage)
                .resizable()
                .frame(width: 40,height: 40)
            VStack(alignment:.leading){
                Text(searchModel.coinName)
                    .font(.system(size: 16))
                    .bold()
                Text(searchModel.coinAmount)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }
          
            Spacer()
        }
       
    }
}

#Preview {
    SearchCoinCell(searchModel: SearchModel(coinImage:"toncoinIcon", coinName: "Ton", coinAmount: "12.40"))
}
