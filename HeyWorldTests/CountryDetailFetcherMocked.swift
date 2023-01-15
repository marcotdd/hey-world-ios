import Foundation

@testable import HeyWorld

class CountryDetailFetcherMocked: CountryDetailFetcherProtocol {
    private let data: CountryDetailed?
    private let error: Error?
    
    init(data: CountryDetailed?, with error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    func fetch() async throws -> CountryDetailed? {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        if let error = error {
            throw error
        }
        
        return data
    }
}
