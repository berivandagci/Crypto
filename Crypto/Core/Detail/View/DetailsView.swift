//
//  DetailsView.swift
//  Crypto
//
//  Created by beri on 5.09.2026.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailsView(coin: coin)
            }
        }
    }
}

struct DetailsView: View {
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing Detail View for \(coin.name ?? "")")
    }
    
    var body: some View {
        Text(coin.name ?? "")
    }
}

#Preview {
    DetailsView(coin: dev.coin)
}
