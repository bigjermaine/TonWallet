//
//  SellBuyModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import Foundation

struct SellBuyModel:Hashable {
    var nameCoin:String
    var imageCoin:String
    var amountCoin:String
    var rate:String
    
}



let dummyData4: [SellBuyModel] = [SellBuyModel(nameCoin: "Minion Jetton", imageCoin: "sellMinionIcon", amountCoin: "2.34 MINI", rate: "MINI ≈ 0.14 TON"),
    SellBuyModel(nameCoin: "Gram", imageCoin: "sellGramIcon", amountCoin: "100 GRAM", rate: "GRAM ≈ 0.14 TON"),
    SellBuyModel(nameCoin: "Tether USDT", imageCoin: "sellTetherIcon", amountCoin: "123 USDT", rate: "USDT ≈ 0.14 TON"),
    SellBuyModel(nameCoin: "Toncoin", imageCoin: "SellTonIcon", amountCoin: "454.5 TON", rate: "Ton ≈ 1 TON")
    
    ]


let dummyData5: [SellBuyModel] = [SellBuyModel(nameCoin: "Bitcoin", imageCoin: "sellBTCIcon", amountCoin: "BTC", rate: "MINI ≈ 0.14 TON"),
    SellBuyModel(nameCoin: "Gram", imageCoin: "sellGramIcon", amountCoin: "100 GRAM", rate: "GRAM ≈ 0.14 TON"),
    SellBuyModel(nameCoin: "Tether USDT (TRON)", imageCoin: "sellTetherIcon", amountCoin: "USDT TRC20", rate: "USDT ≈ 0.14 TON"),
    SellBuyModel(nameCoin: "Third Coin Name", imageCoin: "sellTCNIcon", amountCoin: "TCN", rate: "Ton ≈ 1 TON")
    
    ]


struct SwapBuyModel:Hashable {
    var categoryName:String
    var cetegoryFee:String
    var categoryImage:String
  
}

let dummyData6: [SwapBuyModel] = [SwapBuyModel(categoryName: "Price per 1 MINI", cetegoryFee: "~0.138776 TON", categoryImage: ""),
                                  SwapBuyModel(categoryName: "Blockchain Fee", cetegoryFee: "~0.07 TON", categoryImage: ""),
                                  SwapBuyModel(categoryName: "Routing Fees", cetegoryFee: "Included", categoryImage: "questionIcon"),
                                  SwapBuyModel(categoryName: "Price Impact", cetegoryFee: "0.11%", categoryImage: "questionIcon"),
                                  SwapBuyModel(categoryName: "Minimum Received", cetegoryFee: "86.4 MINI", categoryImage: "questionIcon")
]
