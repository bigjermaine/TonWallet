//
//  SwapView.swift
//  TonWallet
//
//  Created by MacBook AIR on 06/05/2024.
//

import SwiftUI

struct SwapView: View {
    @State var text = ""
    @State var coinAmount = "12345"
    @State var checkCoinAmountColor:Color = .black
    @State var tonBalanceCheck:String = "Enter Amounts"
    @State var continueBackgroundColor:Color = .blue.opacity(0.3)
    @Environment(\.dismiss) var dismiss
    @State  var path: [SwapRoutes] = []
    @ObservedObject var vm = BuySellViewModel()
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color.lightWhite.ignoresSafeArea()
                VStack{
                    headerBar
                    firstSection
                    VStack(spacing:0){
                        listView
                    }
                    
                    
                }
                .onChange(of:text) { x in
                    check1()
                }
            }
            .navigationDestination(for: SwapRoutes.self) { route in
                switch route {
                case.confirmSwap:
                   SwapViewPassword(path: $path)
                        .environmentObject(vm)
                case.Buy:
                    YouBuySwapView(path: $path)
                        .environmentObject(vm)

                case.Sell:
                    YouSellSwapView(path: $path)
                        .environmentObject(vm)

               
                case .Scan:
                    SwapScanner(path: $path)
                }
            }
        }
       
    }
    func check1() {
        guard let x1 =  Int(text) else {return}
        guard let x2 = Int(coinAmount)  else {return}
        if  x1 > x2 {
            checkCoinAmountColor = .red
            tonBalanceCheck = "Insufficient TON Balance"
            continueBackgroundColor = .blue.opacity(0.3)
        }else {
            checkCoinAmountColor = .black
            tonBalanceCheck =  "Swap TON to MINI"
            continueBackgroundColor = .blue
            
        }
    }
}

#Preview {
    SwapView()
}


extension SwapView {
    var listView: some View {
        VStack{
            List {
                
                DisclosureGroup {
                    ForEach(dummyData6,id:\.self) { item2 in
                        HStack{
                            Text(item2.categoryName)
                            Image(item2.categoryImage)
                            Spacer()
                            Text(item2.cetegoryFee)
                            
                        }
                        .listRowBackground( Color.white)
                    }
                }label: {
                    Text("Swap Details")
                        .font(.system(size: 17))
                }
                
            }
            Button{
                
                path.append(.confirmSwap)
                
            }label: {
                Text(tonBalanceCheck)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(continueBackgroundColor)
            .cornerRadius(16)
            .padding(.top,15)
            .padding()
            
        }
    }
    
    
    
    
    var firstSection: some View {
        VStack {
            VStack{

                    HStack{
                      Text("You Sell")
                            .foregroundStyle(.gray)
                           
                      Spacer()
                      Text("12 345 TON")
                            .foregroundStyle(.gray)
                      Text("MAX")
                            .foregroundColor(.blue)
                    }
                    .font(.system(size: 14))
                
                HStack{
                    Button{
                        path.append(.Sell)
                    }label: {
                        HStack{
                            Image("SellTonIcon")
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text("TON")
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                            Image(systemName: "chevron.right")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 6 ,height: 10)
                            
                        }
                    }
                    Spacer()
                   TextField("0", text: $text)
                        .keyboardType(.numberPad)
                        .frame(width: 110)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(checkCoinAmountColor)
                }
                
            }
          
        .padding()
            ZStack{
                Divider()
                Image("convertIcon")
            }
            VStack{
            HStack{
              Text("You Buy")
                    .foregroundStyle(.gray)
                   
              Spacer()
                Text(vm.selectedData.rate)
                    .foregroundStyle(.gray)
          
            }
            .font(.system(size: 14))
          
                HStack{
                    Button{
                        path.append(.Buy)
                    }label: {
                        HStack{
                            Image(vm.selectedData.imageCoin)
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text(vm.selectedData.nameCoin)
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                            Image(systemName: "chevron.right")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 6 ,height: 10)
                            
                        }
                    }
                    Spacer()
                    TextField("0", text: $text)
                        .keyboardType(.numberPad)
                        .frame(width: 110)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.bottom)
            .padding(.horizontal)
        
        }
        .background(Color.white)
        .cornerRadius(8, corners: .allCorners)
        .padding(.horizontal)
       
    }
    var headerBar:some View {
        HStack{
            Button{
                dismiss()
            }label: {
                Image(systemName: "goforward")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .padding(.leading,26)
                
            }
            Spacer()
            Text("Swap")
                .bold()
                .multilineTextAlignment(.center)
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
        .padding(.vertical)
       
    }
    
    
}



enum SwapRoutes: Hashable {
    case confirmSwap
    case Sell
    case Buy
    case Scan
   
}
