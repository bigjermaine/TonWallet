//
//  YouBuySwapView.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import SwiftUI

struct YouBuySwapView: View {
    @State private var searchText = ""
    @EnvironmentObject var vm:BuySellViewModel
    @Binding  var path: [SwapRoutes]
    var filteredArray: [SellBuyModel] {
        if searchText.isEmpty {
            return dummyData4
        } else {
            return dummyData4.filter { category in
                category.nameCoin.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack{
                SearchBar(searchText: $searchText,hasCancel: false) {
                    
                } onCancel:{
                    
                }
                .padding()
                List{
                    Section(header: Text("My assets")
                        .foregroundStyle(.black)
                        .font(.system(size: 20))
                        .bold()
                    
                    ) {
                        ForEach(filteredArray,id:\.self) { item in
                            HStack{
                                Image(item.imageCoin)
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                VStack(alignment:.leading){
                                    Text(item.nameCoin)
                                        .font(.system(size: 16))
                                        .bold()
                                    Text(item.amountCoin)
                                        .font(.system(size: 13))
                                        .foregroundStyle(.gray)
                                }
                                
                                Spacer()
                            }
                            .onTapGesture {
                                vm.didSelectBuy(model: item)
                                path.removeLast()
                            }
                        }
                       
                    }
                    Section(header: Text("Popular")
                        .foregroundStyle(.black)
                        .font(.system(size: 20))
                        .bold()
                    
                    ) {
                        ForEach(dummyData5,id:\.self) { item in
                            HStack{
                                Image(item.imageCoin)
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                VStack(alignment:.leading){
                                    Text(item.nameCoin)
                                        .font(.system(size: 16))
                                        .bold()
                                    Text(item.amountCoin)
                                        .font(.system(size: 13))
                                        .foregroundStyle(.gray)
                                }
                                
                                Spacer()
                            }
                            .onTapGesture {
                                vm.didSelectBuy(model: item)
                                path.removeLast()
                            }
                        }
                       
                    }
                }
                .listStyle(PlainListStyle())
                
            }
        }
        .navigationTitle("You Buy")
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
    YouBuySwapView( path: .constant([.Buy]))
}
