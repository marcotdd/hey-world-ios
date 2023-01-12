import Foundation

final class CountryListViewModel: ObservableObject {
    @Published var state: ViewModelState = .initial
    @Published var countries: [CountryLight]
    
    init() {
        self.state = .success
        self.countries = CountryLight.mokedList
    }
    
    func fetch() {
        print("----> FETCH DATA")
    }
    
    func refresh() {
        print("----> REFRESH")
    }
}