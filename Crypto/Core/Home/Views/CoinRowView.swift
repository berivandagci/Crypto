//
//  CoinRowView.swift
//  Crypto
//
//  Created by beri on 27.08.2026.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            
            Spacer(minLength: 10)
            
            if showHoldingsColumn {
                centerColumn
                Spacer(minLength: 10)
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
    
    private var leftColumn: some View {
        HStack(spacing: 6) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 25, alignment: .leading)
            
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.theme.accent)
            
            Text(coin.symbol?.uppercased() ?? "")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing, spacing: 2) {
            Text((coin.currentHoldingsValue).asCurrencyWith6Decimals())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            Text((coin.currentHoldings ?? 0).asNumberString())
                .font(.caption)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var rightColumn: some View {
            VStack(alignment: .trailing, spacing: 2) {
                Text((coin.currentPrice ?? 0).asCurrencyWith6Decimals())
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                // Pozitifler için başına "+" ekleyen yapı
                Text(formattedPercentString(for: coin.priceChangePercentage24H ?? 0))
                    .font(.caption)
                    .bold()
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                    )
            }
        }
        
        
        private func formattedPercentString(for value: Double) -> String {
            let formatted = String(format: "%.2f", value)
            if value > 0 {
                return "+\(formatted)% "
            } else {
                return "\(formatted)% "
            }
        }
    }

