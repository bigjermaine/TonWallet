//
//  BuyCardQRView.swift
//  TonWallet
//
//  Created by MacBook AIR on 07/05/2024.
//

import SwiftUI
import WebKit
struct BuyCardQRView: View {
    var url:String? =  "https://wallet.ton.org"
    @Binding  var path: [QRRoutes]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            BrowserView(url: URL(string:url ?? "https://tonkeeper.com/privacy")!)
                .edgesIgnoringSafeArea(.all)
        }
        
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
    BuyCardQRView(path: .constant([.Buy]))
}


struct BrowserView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the view if needed
    }
}

struct BuyCardQRView2: View {
    @State var url:String? =  "https://ton.org/buy-toncoin?filters[exchange_groups][slug][$eq]=buy-with-card&pagination[page]=1&pagination[pageSize]=100"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
        ZStack{
            BrowserView(url: URL(string:url ?? "https://ton.org/buy-toncoin?filters[exchange_groups][slug][$eq]=buy-with-card&pagination[page]=1&pagination[pageSize]=100")!)
                .edgesIgnoringSafeArea(.all)
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    HapticManager.shared.vibrate(for: .success)
                 dismiss()
                }label: {
                    Image("CloseButton")
                }
            }
        }
        }
    }
}
