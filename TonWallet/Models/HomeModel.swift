//
//  HomeViewModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 24/03/2024.
//

import Foundation


enum listSection {
    case walletBalance([SwapCoin])
    case button([SwapCoin])
    case first([FirstSection])
    case second([SwapCoin])
  
}

struct FirstSection {
    var coinImage:String
    var coinName:String
    var coinIncreasePercent:String
    var coinAmount:String
    var coinPrice:String
    var coinAmountIncrease:String
}



enum CoinTransactionType {
    case swapCoin
    case swapNft
    case sendCoin
    case sendNft
    case receiveCoin
}

struct SwapCoin:Equatable {
    var coinImage:String
    var mainCoin:String
    var exchangedCoin:String
    var mainCoinAmount:String
    var exchangeCoinAmount:String
    var time:String
    var walletID:String
    var sentCoin:String
    var sentAmount:String
    var sentDollarEquivalent:String
    var sentNFTName:String
    var sentNFTImage:String
    var senfNFTCategpries:String
    var sentNFTUserNmae:String
    var recievedNFTName:String
    var recievedntNFTImage:String
    var recievedNFTCategpries:String
    var recievedNFTUserNmae:String
}



let dummyData: [listSection] = [
    .walletBalance([]),
    .button([]),
    .first([
        FirstSection(coinImage: "jUSDTIcon", coinName: "+0.01%", coinIncreasePercent: "+2.5%", coinAmount: "10 527 USDT", coinPrice: "$1.00", coinAmountIncrease: "$10 527"),
        FirstSection(coinImage: "gramIcon", coinName: "Gram", coinIncreasePercent: "-1.2%", coinAmount: "30 000 GRAM", coinPrice: "$2000", coinAmountIncrease: "$1 500"),
        FirstSection(coinImage: "toncoinIcon", coinName: "Toncoin", coinIncreasePercent: "+1.12%", coinAmount: "100 000.25 TON", coinPrice: "$5.34", coinAmountIncrease: "$534,000"),
        FirstSection(coinImage: "duckCoinIcon", coinName: "Duck Coin", coinIncreasePercent: "-98.3%", coinAmount: "12.34 DUCK", coinPrice: "$0.0001", coinAmountIncrease: "$0")
    ]),
         .second([SwapCoin(coinImage: "Red", mainCoin: "", exchangedCoin: "", mainCoinAmount: "", exchangeCoinAmount: "", time: "Sent · 08:40", walletID: "UQBK...y8I1", sentCoin: "25 TON", sentAmount: "$50", sentDollarEquivalent: "$50", sentNFTName: "", sentNFTImage: "", senfNFTCategpries: "", sentNFTUserNmae: "", recievedNFTName: "", recievedntNFTImage: "", recievedNFTCategpries: "", recievedNFTUserNmae: ""),SwapCoin(coinImage: "tonIcon", mainCoin: "TON", exchangedCoin: "GRAM", mainCoinAmount: "+1 000 GRAM", exchangeCoinAmount: "-10 TON", time: "Swapped · 8:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "", senfNFTCategpries: "", sentNFTUserNmae: "", recievedNFTName: "", recievedntNFTImage: "", recievedNFTCategpries: "", recievedNFTUserNmae: ""),SwapCoin(coinImage: "Purple", mainCoin: "", exchangedCoin: "", mainCoinAmount: "", exchangeCoinAmount: "", time: "Sent NFT · 08:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "catImage", senfNFTCategpries: "", sentNFTUserNmae: "alice.ton", recievedNFTName: "Cat #918", recievedntNFTImage: "", recievedNFTCategpries: "Rich Cats", recievedNFTUserNmae: ""),
                  SwapCoin(coinImage: "Purple", mainCoin: "", exchangedCoin: "", mainCoinAmount: "", exchangeCoinAmount: "", time: "Sent NFT · 08:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "catImage", senfNFTCategpries: "", sentNFTUserNmae: "alice.ton", recievedNFTName: "Cat #918", recievedntNFTImage: "", recievedNFTCategpries: "Rich Cats", recievedNFTUserNmae: ""),SwapCoin(coinImage: "Purple", mainCoin: "", exchangedCoin: "", mainCoinAmount: "", exchangeCoinAmount: "", time: "Sent NFT · 08:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "catImage", senfNFTCategpries: "", sentNFTUserNmae: "alice.ton", recievedNFTName: "Cat #918", recievedntNFTImage: "", recievedNFTCategpries: "Rich Cats", recievedNFTUserNmae: ""),SwapCoin(coinImage: "Purple", mainCoin: "", exchangedCoin: "", mainCoinAmount: "", exchangeCoinAmount: "", time: "Sent NFT · 08:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "catImage", senfNFTCategpries: "", sentNFTUserNmae: "alice.ton", recievedNFTName: "Cat #918", recievedntNFTImage: "", recievedNFTCategpries: "Rich Cats", recievedNFTUserNmae: ""),SwapCoin(coinImage: "tonIcon", mainCoin: "TON", exchangedCoin: "GRAM", mainCoinAmount: "+1 000 GRAM", exchangeCoinAmount: "-10 TON", time: "Swapped · 8:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "", senfNFTCategpries: "", sentNFTUserNmae: "", recievedNFTName: "", recievedntNFTImage: "", recievedNFTCategpries: "", recievedNFTUserNmae: ""),SwapCoin(coinImage: "tonIcon", mainCoin: "TON", exchangedCoin: "GRAM", mainCoinAmount: "+1 000 GRAM", exchangeCoinAmount: "-10 TON", time: "Swapped · 8:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "", senfNFTCategpries: "", sentNFTUserNmae: "", recievedNFTName: "", recievedntNFTImage: "", recievedNFTCategpries: "", recievedNFTUserNmae: ""),SwapCoin(coinImage: "tonIcon", mainCoin: "TON", exchangedCoin: "GRAM", mainCoinAmount: "+1 000 GRAM", exchangeCoinAmount: "-10 TON", time: "Swapped · 8:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "", senfNFTCategpries: "", sentNFTUserNmae: "", recievedNFTName: "", recievedntNFTImage: "", recievedNFTCategpries: "", recievedNFTUserNmae: ""),
                  SwapCoin(coinImage: "marioImage", mainCoin: "", exchangedCoin: "", mainCoinAmount: "", exchangeCoinAmount: "", time: "Received NFT · 08:40", walletID: "", sentCoin: "", sentAmount: "", sentDollarEquivalent: "", sentNFTName: "", sentNFTImage: "", senfNFTCategpries: "ee", sentNFTUserNmae: "mario.t.me", recievedNFTName: "Dave NFT", recievedntNFTImage: "phinease", recievedNFTCategpries: "", recievedNFTUserNmae: "")
                  
                  
    
                 
                ]),
    
  
         
    
]
