//
//  BuySellViewModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import Foundation

class BuySellViewModel:ObservableObject {
    
    @Published var assetData:[SellBuyModel] = dummyData4
    @Published var popularData:[SellBuyModel] = dummyData5
    @Published var selectedData:SellBuyModel = SellBuyModel(nameCoin: "Minion Jetton", imageCoin: "sellMinionIcon", amountCoin: "2.34 MINI", rate: "MINI ≈ 0.14 TON")
    
    func didSelectBuy(model:SellBuyModel) {
        selectedData = model
    }
    
}
