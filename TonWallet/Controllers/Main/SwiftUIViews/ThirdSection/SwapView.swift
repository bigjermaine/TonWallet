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
    @State var shown = true
    @State var isSuccess = false
    @State var message = ""
    @State var c: AlertAction?
    @State  var path: [SwapRoutes] = []
    @ObservedObject var vm = BuySellViewModel()
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
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
                Color.black.opacity(shown ? 0.2 : 0)
                    .ignoresSafeArea()
               

                if shown {
                    AlertView(shown: $shown, closureA: $c, isSuccess: isSuccess, message: message)
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
                        .environmentObject(vm)
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
            HapticManager.shared.vibrate(for: .success)
            
        } else if x1 < 0 {
            
            tonBalanceCheck =  "Enter Amounts"
            continueBackgroundColor = .blue.opacity(0.3)
            HapticManager.shared.vibrate(for: .success)
        
            
        }else {
            checkCoinAmountColor = .black
            tonBalanceCheck =  "Swap TON to MINI"
            continueBackgroundColor = .blue
            HapticManager.shared.vibrate(for: .error)
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
                        .onTapGesture {
                            shown = true
                        }
                }
                
            }
            Button{
                HapticManager.shared.vibrateForSelection()
                path.append(.confirmSwap)
                
            }label: {
                Text(tonBalanceCheck)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(continueBackgroundColor)
            .cornerRadius(12)
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
                        .bold()
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
                        .bold()
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
                text = ""
            }label: {
                Image("X")
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



struct AlertView: View {
     
     @Binding var shown: Bool
     @Binding var closureA: AlertAction?
     var isSuccess: Bool
     var message: String
     
     var body: some View {
         VStack {
             Image("questionImageIcon")
                 .padding(.top,5)
             Text("Price Impact")
                 .foregroundColor(Color.black)
                 .bold()
                 .padding(.bottom,10)
             
             VStack(spacing:20){
                 Text("This shows how much your trade might change the token price.")
                     .multilineTextAlignment(.center)
                     .font(.system(size: 13))
                 Text("Big trades can make the price go up or down more. Lower is usually better. how much your trade might change the token price.")
                     .multilineTextAlignment(.center)
                     .font(.system(size: 13))
             }
            Divider()
             
             Button("OK") {
                    closureA = .cancel
                    shown.toggle()
                }
                .foregroundColor(.blue)
                .padding(.top,5)
             
         }.frame(width: 270, height: 253)
         
         .background(Color.white)
         .cornerRadius(12)
         .clipped()
         
     }
 }

enum AlertAction {
    case ok
    case cancel
    case others
}


struct AlertView2: View {
     
     @Binding var shown: Bool
     @Binding var closureA: AlertAction?
     var isSuccess: Bool
     var message: String
     
     var body: some View {
         VStack(spacing:8){
             VStack(spacing:5){
                 Image("questionImageIcon")
                     .padding(.top,8)
                 Text("Why Staking is Safe")
                     .foregroundColor(Color.black)
                     .bold()
                    
             }
             VStack(alignment: .leading, spacing:20){
                 Text("1. Staking is fully decentralized and operated by the official TON Liquid Staking smart contracts.")
                     .multilineTextAlignment(.leading)
                     .font(.system(size: 13))
                 Text("2. The deposited stake will be used for the TON network validation as part of its proof-of-stake essence. ")
                     .multilineTextAlignment(.leading)
                     .font(.system(size: 13))
                 Text("3. You can withdraw your stake at any time and it will be deposited back to your account within two days. ")
                     .multilineTextAlignment(.leading)
                     .font(.system(size: 13))
             }
             .padding()
            Divider()
             HStack{
                 Button("OK") {
                     closureA = .cancel
                     shown.toggle()
                 }
                 .foregroundColor(.blue)
                 .padding(.top,8)
             }
                .frame(width: 280)
            
             
         }.frame(width: 280, height: 380)
         
         .background(Color.white)
         .cornerRadius(12)
         .clipped()
         
     }
 }
