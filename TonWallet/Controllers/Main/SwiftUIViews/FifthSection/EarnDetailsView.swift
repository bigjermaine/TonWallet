//
//  EarnDetailsView.swift
//  TonWallet
//
//  Created by MacBook AIR on 08/05/2024.
//

import SwiftUI

struct EarnDetailsView: View {
    @ObservedObject var stakeViewModel = StakeViewModel()
    @Binding  var path: [StakeRoutes]
    var body: some View {
        ZStack{
            Color.lightWhite.ignoresSafeArea(.all)
            VStack(spacing:20){
                HStack{
                    Text("7 220.25")
                        .font(.system(size: 48))
                        .bold()
                        .foregroundStyle(Color.black)
                    Text("TON")
                        .foregroundStyle(.gray)
                        .font(.system(size: 32))
                        .bold()
                }
                Text("Your staking balance")
                    .foregroundStyle(.gray)
                    .bold()
                HStack(spacing:20){
                    Button(action: {
                        path.append(.addStake)
                    }) {
                        Text("Add Stake")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .cornerRadius(12, corners: .allCorners)
                    
                    Button{
                        path.append(.unstake)
                    }label: {
                        Text("Unstake")
                            .foregroundStyle(.blue)
                            .bold()
                            .padding()
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(12, corners: .allCorners)
                    
                    
                }
                .padding(.horizontal,20)
                Spacer()
                VStack(spacing:0){
                    HStack{
                        Text("History")
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                        Text("Earned: 150 TON")
                            .foregroundStyle(.gray)
                    }
                    
                    .padding()
                    List(stakeViewModel.data){ x in
                        
                        HStack{
                            switch x.type {
                            case.Earned:
                                Image("earnedIcon")
                            case.Stake:
                                Image("stakeIcon")
                            case.UnStake:
                                Image("unstakeIcon")
                            case.Unstaking:
                                Image("unstakingIcon")
                                
                            }
                            VStack(alignment: .leading){
                                Text(x.name)
                                    .font(.system(size: 14))
                                    .bold()
                                Text(x.date)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                
                                
                                switch x.type {
                                case.Earned:
                                    Text(x.amount)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundStyle(.green)
                                    Text(x.totalAmount)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.green)
                                case.Stake:
                                    Text(x.amount)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundStyle(.black)
                                    Text(x.totalAmount)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray)
                                case.UnStake:
                                    Text(x.amount)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundStyle(.gray)
                                    Text(x.totalAmount)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray)
                                case.Unstaking:
                                    Text(x.amount)
                                        .font(.system(size: 14))
                                        .bold()
                                        .foregroundStyle(.gray)
                                    Text(x.totalAmount)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray)
                                }
                                
                            }
                        }
                        
                        
                    }
                 
                    .listStyle(.plain)
                }
                .frame(maxWidth:.infinity)
                .background(Color.white)
                .cornerRadius(16, corners: [.topLeft,.topRight])
                
            }
            .padding(.top,30)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                        path.removeAll()
                    }label: {
                        Image("CloseButton")
                    }
                    
                    
                }
                
                ToolbarItem(placement: .principal) {
                    Button{
                        HapticManager.shared.vibrate(for: .success)
                         path.removeAll()
                    }label: {
                        Text("Earn")
                            .foregroundStyle(.black)
                            .bold()
                    }
                    
                    
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    EarnDetailsView(path: .constant([.earn]))
}


