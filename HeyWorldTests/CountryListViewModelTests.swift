import XCTest
@testable import HeyWorld

final class CountryListViewModelTests: XCTestCase {
    
    @MainActor func testCountryList() async throws {
        let fetcher = CountryListFetcherMocked(data: CountryLight.mokedList)
        let viewModel = CountryListViewModel(fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertTrue(viewModel.countries.count == 4)
        XCTAssertTrue(viewModel.state == .success)
    }
    
    @MainActor func testCountryListNil() async throws {
        let fetcher = CountryListFetcherMocked(data: nil)
        let viewModel = CountryListViewModel(fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertTrue(viewModel.countries.isEmpty)
        XCTAssertTrue(viewModel.state == .success)
    }
    
    @MainActor func testCountryListEmpty() async throws {
        let fetcher = CountryListFetcherMocked(data: [])
        let viewModel = CountryListViewModel(fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertTrue(viewModel.countries.isEmpty)
        XCTAssertTrue(viewModel.state == .success)
    }
    
    @MainActor func testCountryListWithError() async throws {
        let fetcher = CountryListFetcherMocked(data: [], with: HeyWorldError.emptyDataError)
        let viewModel = CountryListViewModel(fetcher: fetcher)
        
        XCTAssertTrue(viewModel.state == .initial)
        await viewModel.fetch()
        XCTAssertTrue(viewModel.state == .failure(HeyWorldError.emptyDataError))
    }
}
