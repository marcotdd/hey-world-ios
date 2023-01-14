import Foundation
import Combine

@MainActor
final class CountryListViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: ViewModelState = .initial
    
    var countries: [CountryLight] = []
    
    private let fetcher: CountryListFetcher
    
    // MARK: - Initializer
    
    init() {
        fetcher = CountryListFetcher()
    }
    
    // MARK: - Fetch methods
    
//    func fetch() {
//        fetcher.fetch()
//    }
    
    func fetchAA() async {
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
