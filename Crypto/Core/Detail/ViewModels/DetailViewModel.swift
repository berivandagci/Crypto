import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetails
            .sink { [weak self] (returnedCoinDetails) in
                print("RECEIVED COIN DETAIL DATA")
                if let returnedCoinDetails = returnedCoinDetails {
                    print(returnedCoinDetails.readableDescription ?? "")
                    self?.coinDetails = returnedCoinDetails
                }
            }
            .store(in: &cancellables)
    }
}
