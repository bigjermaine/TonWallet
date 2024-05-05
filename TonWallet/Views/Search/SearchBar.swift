//
//  SearchBar.swift
//  TonWallet
//
//  Created by MacBook AIR on 03/05/2024.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    var title: String = "Search"
    @Binding var searchText: String
    var hasCancel: Bool = true
    var action: ()->()
    var onCancel: ()->()
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 44)
                    .cornerRadius(12)
                    .foregroundColor(.gray.opacity(0.1))
                HStack {
                    Spacer()
                    Image(systemName:"magnifyingglass")
                         .resizable()
                         .frame(width: 20,height: 20)
                         .foregroundColor(.gray)
                         .padding(.leading,30)
                    
                    TextField(title, text: $searchText.onChange { x in
                       action()
                    })
                    .font(.system(size: 20,weight: .regular))
                    .frame(height: 44)
                    .textFieldStyle(.plain)
                    .cornerRadius(12)
                    .padding(.leading,10)
                
                }
                .background(.gray.opacity(0.1))
                .cornerRadius(12)
            }
            if hasCancel {
                Button(action: {
                    searchText = ""
                    onCancel()
                }) {
                    Text("Cancel")
                        .font(.system(size: 34,weight: .regular))
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut(duration: 1.0), value: UUID())
            }
        }
    }
}


extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
