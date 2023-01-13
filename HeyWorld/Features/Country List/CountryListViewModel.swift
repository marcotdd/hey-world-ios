import Foundation
import Combine

final class CountryListViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: ViewModelState = .initial
    
    var countries: [CountryLight] = []
    
    private var bag = Set<AnyCancellable>()
    private let fetcher: CountryListFetcher
    
    // MARK: - Initializer
    
    init() {
        fetcher = CountryListFetcher()
        
        fetcher.$state.sink { fetcherState in
            switch fetcherState {
            case .success(let countries):
                self.countries = countries
                self.state = .success
                
            case .initial:
                self.state = .initial
                
            case .loading:
                self.state = .loading
                
            case .failure(let error):
                self.state = .failure(error)
            }
        }.store(in: &bag)
    }
    
    // MARK: - Fetch methods
    
    func fetch() {
        fetcher.fetch()
    }
    
    func refresh() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.fetcher.fetch()
//        }
    }
}
