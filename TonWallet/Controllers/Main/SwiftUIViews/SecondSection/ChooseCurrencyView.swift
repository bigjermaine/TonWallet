//
//  ChooseCurrencyView.swift
//  TonWallet
//
//  Created by MacBook AIR on 03/05/2024.
//

import SwiftUI

struct ChooseCurrencyView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @State  var path: [AuthRoutes] = []
    var filteredArray: [SearchModel] {
        if searchText.isEmpty {
            return dummyData2
        } else {
            return dummyData2.filter { category in
                category.coinName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color.white.ignoresSafeArea()
                VStack{
                    headerBar
                    SearchBar(searchText: $searchText,hasCancel: false) {
                        
                    } onCancel:{
                        
                    }
                    .padding()
                    .cornerRadius(10)
                    
                    
                    List {
                        ForEach(filteredArray) { item in
                            SearchCoinCell(searchModel: item)
                        }
                        .background(Color.white)
                        .onTapGesture {
                            path.append(.QrScanner)
                            HapticManager.shared.vibrateForSelection()
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.white)
                    Spacer()
                    
                }
                .padding(.top,20)
            }
            .navigationDestination(for: AuthRoutes.self) { route in
                switch route {
                case.RecipientAddressView:
                    RecipientAddressView(path: $path)
                case.SendSpecificAmountTokenView:
                    SendSpecificAmountTokenView(path: $path)
                case.SendTonFillDescriptionView:
                    SendTonFillDescriptionView(path: $path)
                case.SendTonPasswordView:
                    SendTonPasswordView(path: $path)
                case.SendDisplayCoinView:
                    SendDisplayCoinView(path: $path)
                case.QrScanner:
                    QRScannerView()
                }
            }
        }
    }
}

#Preview {
    ChooseCurrencyView()
}



extension ChooseCurrencyView {
    
    var headerBar:some View {
        HStack{
            Spacer()
            Text("Choose Currency")
                .bold()
                .multilineTextAlignment(.center)
                .padding(.leading,40)
                .font(.system(size: 17))
            
            Spacer()
            Button{
                dismiss()
            }label: {
                Image("CloseButton")
                    .frame(width: 20,height: 20)
                    .padding(.trailing,26)
                
            }
        }
       
    }
    }



enum AuthRoutes: Hashable {
    case RecipientAddressView
    case SendSpecificAmountTokenView
    case SendTonFillDescriptionView
    case SendTonPasswordView
    case SendDisplayCoinView
    case QrScanner
 
}
