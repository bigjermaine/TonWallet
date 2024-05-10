//
//  RecipientAddressView.swift
//  TonWallet
//
//  Created by MacBook AIR on 04/05/2024.
//

import SwiftUI

struct RecipientAddressView: View {
    @State private var searchText = ""
    @Binding  var path: [AuthRoutes]
    var filteredArray: [SearchModel] {
        if searchText.isEmpty {
            return dummyData3
        } else {
            return dummyData3.filter { category in
                category.coinName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            ScanSearchBar(searchText:$searchText,hasCancel: true) {
                
            } onCancel: {
                HapticManager.shared.vibrateForSelection()
                path.append(.QrScanner)
            }
            Text("Recent")
                .font(.system(size: 20))
                .bold()
                .padding([.horizontal,.top])
                .padding(.leading,5)
                
            List {
                ForEach(filteredArray) { item in
                    SearchCoinCell(searchModel: item)
                }
                .background(Color.white)
                .onTapGesture {
                    HapticManager.shared.vibrateForSelection()
                    path.append(.SendSpecificAmountTokenView)
                }
                
            }
            .listStyle(PlainListStyle())
            .background(Color.white)
            Spacer()
            
        }
        .navigationTitle("Recipient Address")
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
    RecipientAddressView(path: .constant([.RecipientAddressView]))
}





