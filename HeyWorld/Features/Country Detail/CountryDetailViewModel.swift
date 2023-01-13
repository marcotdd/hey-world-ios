import Foundation
import Combine

final class CountryDetailViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: ViewModelState = .initial
    
    var country: CountryDetailed?
    let title: String
    
    private var bag = Set<AnyCancellable>()
    private let fetcher: CountryDetailFetcher
    
    // MARK: - Computed Properties
    
    /// Provide a formatted list of languages with the native version (e.g. Italian (Italian), English (English))
    var formattedLanguages: String? {
        guard let country = country else { return nil }
        guard !country.languages.isEmpty else { return "-" }
        
        return country.languages.compactMap {
            guard let name = $0.name, let native = $0.native else { return nil }
            return "\(name) (\(native))"
        }.joined(separator: ", ")
    }
    
    // MARK: - Initializer
    
    init(country: CountryProtocol) {
        self.title = country.name
        self.fetcher = CountryDetailFetcher(code: country.code)
        
        fetcher.$state.sink { fetcherState in
            switch fetcherState {
            case .success(let country):
                self.country = country
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
        print("----> REFRESH")
    }
}
