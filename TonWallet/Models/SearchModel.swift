//
//  SearchViewModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 04/05/2024.
//

import Foundation

struct SearchModel:Identifiable {
    var id = UUID().uuidString
    
    var coinImage:String
    var coinName:String
    var coinAmount:String
    
}


let dummyData2: [SearchModel] = [
    SearchModel(coinImage: "toncoinIcon", coinName: "Toncoin", coinAmount: "454.40 Ton"),
    SearchModel(coinImage: "gramIcon", coinName: "Gram", coinAmount: "200.00 GRAM"),
    SearchModel(coinImage: "duckCoinIcon", coinName: "DuckCoin", coinAmount: "12.34 MINI")
    
    ]




let dummyData3: [SearchModel] = [
    SearchModel(coinImage: "Purple", coinName: "UQafc...33A76", coinAmount: "4Wallet"),
    SearchModel(coinImage: "Red", coinName: "UQBKD...iy8I1", coinAmount: "UQbge...12B34"),
    SearchModel(coinImage: "Red", coinName: "UQBKD...iy8I1", coinAmount: "Wallet")
    
    ]
