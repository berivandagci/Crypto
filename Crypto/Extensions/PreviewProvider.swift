import Foundation
import SwiftUI

let dev = DeveloperPreview.instance

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let state1 = StatisticModel(title: "Market Cap", value: "$$1.60 Trillion", percentageChange: 2.42)
    let state2 = StatisticModel(title: "24h Volume", value: "$30.61 B", percentageChange: nil)
    let state3 = StatisticModel(title: "BTC Dominance", value: "58.5%", percentageChange: -0.4)
    let state4 = StatisticModel(title: "Portfolio Value", value: "$199,732", percentageChange: 2.15)
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 79893.0,
        marketCap: 1604119420810.0,
        marketCapRank: 1,
        fullyDilutedValuation: 1604119420810.0,
        totalVolume: 30612070241.0,
        high24H: 80475.0,
        low24H: 77648.0,
        priceChange24H: 1879.56,
        priceChangePercentage24H: 2.14882,
        marketCapChange24H: 37976970781.0,
        marketCapChangePercentage24H: 2.42487,
        circulatingSupply: 20075925.0,
        totalSupply: 20075925.0,
        maxSupply: 21000000.0,
        ath: 126080.0,
        athChangePercentage: -36.63341,
        athDate: "2025-10-06T10:57:42.000Z",
        atl: 67.81,
        atlChangePercentage: 117719.95181,
        atlDate: "2013-07-05T16:00:00.000Z",
        lastUpdated: "2026-08-27T14:32:30.000Z",
        sparklineIn7D: SparklineIn7D(price: [71618.6, 71748.9, 72000.0, 71500.0, 73000.0]),
        priceChangePercentage24HInCurrency: 2.14882,
        currentHoldings: 2.5
    )
}
