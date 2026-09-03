import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Market Cap", value: "$2.36T", percentageChange: 2.1),
        StatisticModel(title: "24h Volume", value: "$97.6B", percentageChange: nil),
        StatisticModel(title: "BTC Dominance", value: "54.2%", percentageChange: -0.4),
        StatisticModel(title: "Portfolio Value", value: "$45,231", percentageChange: 5.4)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .combineLatest(dataService.$allCoins)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, startingCoins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return startingCoins
        }
        
        let lowercasedText = text.lowercased()
        return startingCoins.filter { (coin) -> Bool in
            return (coin.name ?? "").lowercased().contains(lowercasedText) ||
                   (coin.symbol ?? "").lowercased().contains(lowercasedText) ||
                   (coin.id ?? "").lowercased().contains(lowercasedText)
        }
    }
}
