import Foundation
import Combine

final class CountryDetailViewModel: ObservableObject {
    @Published var state: ViewModelState = .initial
    @Published var country: CountryDetailed?
    
    private var bag = Set<AnyCancellable>()
    private let fetcher: CountryDetailFetcher
    
    let title: String
    var formattedLanguages: String? {
        guard let country = country else { return nil }
        guard !country.languages.isEmpty else { return "-" }
        
        return country.languages.compactMap {
            guard let name = $0.name, let native = $0.native else { return nil }
            return "\(name) (\(native))"
        }.joined(separator: ", ")
    }
    
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
    
    func fetch() {
        fetcher.fetch()
    }
    
    func refresh() {
        print("----> REFRESH")
    }
}
