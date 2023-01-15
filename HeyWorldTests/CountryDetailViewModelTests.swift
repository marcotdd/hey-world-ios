import XCTest

@testable import HeyWorld

final class CountryDetailViewModelTests: XCTestCase {

    @MainActor func testCountryDetail() async throws {
        let fetcher = CountryDetailFetcherMocked(data: CountryDetailed.mokedElement)
        let viewModel = CountryDetailViewModel(country: CountryLight.mokedElement, fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertNotNil(viewModel.country)
        XCTAssertTrue(viewModel.state == .success)
    }
    
    @MainActor func testCountryDetailNil() async throws {
        let fetcher = CountryDetailFetcherMocked(data: nil)
        let viewModel = CountryDetailViewModel(country: CountryLight.mokedElement, fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertNil(viewModel.country)
        XCTAssertTrue(viewModel.state == .success)
    }
    
    @MainActor func testCountryDetailWithError() async throws {
        let fetcher = CountryDetailFetcherMocked(data: CountryDetailed.mokedElement, with: HeyWorldError.emptyDataError)
        let viewModel = CountryDetailViewModel(country: CountryLight.mokedElement, fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertNil(viewModel.country)
        XCTAssertTrue(viewModel.state == .failure(HeyWorldError.emptyDataError))
    }
}
