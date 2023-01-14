import Foundation
import Combine

@MainActor
final class CountryDetailViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var state: ViewModelState = .initial
    
    var country: CountryDetailed?
    let title: String
    
    private let fetcher: CountryDetailFetcher
    
    // MARK: - Computed Properties
    
    /// It provides a formatted list of languages with the native version (e.g. Italian (Italian), English (English))
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
    }
    
    // MARK: - Fetch methods
    
    func fetchAA() async {
        self.state = .loading
        do {
            self.country = try await fetcher.fetch()
            self.state = .success
        } catch let error as HeyWorldError {
            self.state = .failure(error)
        } catch {
            self.state = .failure(HeyWorldError.unknownError)
        }
    }
    
    func refresh() async {
        do {
            self.country = try await fetcher.fetch()
            self.state = .success
        } catch let error as HeyWorldError {
            self.state = .failure(error)
        } catch {
            self.state = .failure(HeyWorldError.unknownError)
        }
    }
}
