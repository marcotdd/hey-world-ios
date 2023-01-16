import Foundation

@testable import HeyWorld

class CountryListFetcherMocked: CountryListFetcherProtocol {
    private let data: [CountryLight]?
    private let error: Error?
    
    init(data: [CountryLight]?, with error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    func fetch() async throws -> [CountryLight]? {
        try await Task.sleep(nanoseconds: 5_000_000)
        
        if let error = error {
            throw error
        }
        
        return data
    }
}
