//
//  CoinModel.swift
//  Crypto
//
//  Created by beri on 24.08.2026.
//

import Foundation

// CoinGecko API info
/*
 URL:
 https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&ids=bitcoin&x_cg_demo_api_key=CG-xG6yae7fVeiF6V4pjTDnjbaA
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 79893,
     "market_cap": 1604119420810,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1604119420810,
     "total_volume": 30612070241,
     "high_24h": 80475,
     "low_24h": 77648,
     "price_change_24h": 1879.56,
     "price_change_percentage_24h": 2.14882,
     "market_cap_change_24h": 37976970781,
     "market_cap_change_percentage_24h": 2.42487,
     "circulating_supply": 20075925,
     "total_supply": 20075925,
     "max_supply": 21000000,
     "ath": 126080,
     "ath_change_percentage": -36.63341,
     "ath_date": "2025-10-06T10:57:42.000Z",
     "atl": 67.81,
     "atl_change_percentage": 117719.95181,
     "atl_date": "2013-07-05T16:00:00.000Z",
     "roi": null,
     "last_updated": "2026-08-27T14:32:30.000Z",
     "sparkline_in_7d": {
       "price": [71618.6828896546, 71748.9641715209]
  },
     "price_change_percentage_24h_in_currency": 2.14882
   }
 */

struct CoinModel: Identifiable, Codable {
    let id: String?
    let symbol: String?
    let name: String?
    let image: String?
    let currentPrice: Double?
    let marketCap: Double?
    let marketCapRank: Double?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double? // Kullanıcının cüzdanında bu coinden kaç tane olduğunu tutmak için özel alan
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    // Cüzdan miktarını güncelleyip coinin yeni bir kopyasını döndüren fonksiyon
    func updatedHoldings(amount: Double) -> CoinModel {
        return CoinModel(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H,
            low24H: low24H,
            priceChange24H: priceChange24H,
            priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: marketCapChange24H,
            marketCapChangePercentage24H: marketCapChangePercentage24H,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHoldings: amount
        )
    }
    
    // Kullanıcının elindeki coinin toplam USD değeri (Miktar * Anlık Fiyat)
        var currentHoldingsValue: Double {
            return (currentHoldings ?? 0) * (currentPrice ?? 0)
        }
        
        // Market sıralamasını tam sayı (Integer) olarak veren yardımcı özellik
        var rank: Int {
            return Int(marketCapRank ?? 0)
        }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
