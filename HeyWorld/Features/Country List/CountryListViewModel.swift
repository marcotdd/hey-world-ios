import Foundation
import Combine

@MainActor
final class CountryListViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: ViewModelState = .initial
    
    var countries: [CountryLight] = []
    
    private let fetcher: CountryListFetcherProtocol
    
    // MARK: - Initializer
    
    init(fetcher: CountryListFetcherProtocol? = nil) {
        if let fetcher {
            self.fetcher = fetcher
        } else {
            self.fetcher = CountryListFetcher()
        }
    }
    
    // MARK: - Fetch methods
    
    func fetch() async {
        self.state = .loading
        do {
            self.countries = try await fetcher.fetch() ?? []
            self.state = .success
        } catch let error as HeyWorldError {
            self.state = .failure(error)
        } catch {
            self.state = .failure(HeyWorldError.unknownError)
        }
    }
    
    func refresh() async {
        do {
            self.countries = try await fetcher.fetch() ?? []
            self.state = .success
        } catch let error as HeyWorldError {
            self.state = .failure(error)
        } catch {
            self.state = .failure(HeyWorldError.unknownError)
        }
    }
}
