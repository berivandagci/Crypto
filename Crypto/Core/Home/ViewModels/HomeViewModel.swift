import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
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
