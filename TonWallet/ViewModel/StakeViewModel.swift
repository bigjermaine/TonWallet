//
//  StakeViewModel.swift
//  TonWallet
//
//  Created by MacBook AIR on 08/05/2024.
//

import Foundation


class StakeViewModel :ObservableObject {
    @Published var data:[StakeModel] =    dummydata7
    @Published var data1:[StakeModel] =  dummydata8
    
    func dataSwitch() {
        data = dummydata8
    }
    
}
