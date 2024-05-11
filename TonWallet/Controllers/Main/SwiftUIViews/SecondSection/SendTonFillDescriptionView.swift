//
//  SendTonFillDescriptionView.swift
//  TonWallet
//
//  Created by MacBook AIR on 04/05/2024.
//

import SwiftUI

struct SendTonFillDescriptionView: View {
    @Binding  var path: [AuthRoutes]
    @State var text = ""
    var body: some View {
        ZStack {
            Color.seedPhaseCell.ignoresSafeArea()
            VStack{
                List{
                    Section("Message") {
                        HStack{
                            TextEditor(text: $text)
                        }
                        HStack{
                            Text("Encrypt comment")
                            Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                                
                            })
                        }
                    }
                    Section("Transaction Details") {
                        secondListSection
                    }
                    
                    
                }
                
                Button{
                    HapticManager.shared.vibrateForSelection()
                    path.append(.SendTonPasswordView)
                }label: {
                    Text("Send TON")
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.blue)
                .cornerRadius(12)
                .padding(.top,15)
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                    path.removeAll()
                }label: {
                    Image("CloseButton")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                    path.removeLast()
                }label: {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    SendTonFillDescriptionView(path: .constant([.SendTonFillDescriptionView]))
}


extension SendTonFillDescriptionView {
    var secondListSection: some View {
        VStack{
            HStack{
                Text("Recipient")
                Spacer()
                Text("john.ton")
            }
            .frame(height: 30)
            HStack{
                Text("Recipient address")
                Spacer()
                Text("UQCD...qEBI")
            }
            .frame(height: 30)
            HStack{
                Text("Amount")
                Spacer()
                Text("123.4 TON")
            }
            .frame(height: 30)
            HStack{
                Text("Fee")
                Spacer()
                Text("0.07 TON")
            }
            .frame(height: 30)
        }
    }
}
