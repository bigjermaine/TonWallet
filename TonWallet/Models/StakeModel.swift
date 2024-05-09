//
//  StakeModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 08/05/2024.
//

import Foundation

struct  StakeModel:Identifiable {
    var id:UUID = UUID()
    var name:String
    var date:String
    var amount:String
    var totalAmount:String
    var type:stakeType
    
    
}


enum stakeType {
    case Stake
    case UnStake
    case Earned
    case Unstaking

    
}
let dummydata7:[StakeModel] = [StakeModel(name: "Unstaked", date: "28 January · 08:40", amount: "125 TON", totalAmount: "$24 690", type: .UnStake),StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Staked", date: "28 January · 08:40", amount: "7 345 TON", totalAmount: "$24 690", type: .Stake)
                               
                        
]


let dummydata8:[StakeModel] = [
    StakeModel(name: "Unstaking", date: "Receive in 1 hour 27 minutes", amount: "7 220.25 TON", totalAmount: "$24 690", type: .Unstaking),StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
    StakeModel(name: "Unstaked", date: "28 January · 08:40", amount: "125 TON", totalAmount: "$24 690", type: .UnStake),StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
    StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
    StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
    StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
    StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
    StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Earned", date: "28 January · 08:40", amount: "+0.05 TON", totalAmount: "$0.1", type: .Earned),
                               StakeModel(name: "Staked", date: "28 January · 08:40", amount: "7 345 TON", totalAmount: "$24 690", type: .Stake)
                               
                        
]
