//
//  CoinRowView.swift
//  Crypto
//
//  Created by beri on 27.08.2026.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool // Portföy sütunu gösterilsin mi?
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
                centerColumn
            }
            
            if showHoldingsColumn {
                Spacer()
            }
            
            rightColumn
        }
        .font(.subheadline)
        .padding(.vertical, 4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
}

extension CoinRowView {
    
    // 1. Sol Taraf: Sıralama, Logo ve Sembol
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.theme.accent)
            
            Text(coin.symbol?.uppercased() ?? "")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    // 2. Orta Taraf: Portföy Değeri ve Miktarı
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text((coin.currentHoldingsValue).asCurrencyWith6Decimals())
                .font(.headline)
            
            Text((coin.currentHoldings ?? 0).asNumberString())
                .font(.caption)
        }
        .foregroundColor(Color.theme.accent)
    }
    
    // 3. Sağ Taraf: Fiyat ve 24 Saatlik Değişim Oranı
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text((coin.currentPrice ?? 0).asCurrencyWith6Decimals())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            Text((coin.priceChangePercentage24H ?? 0).asPercentString())
                .font(.caption)
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
