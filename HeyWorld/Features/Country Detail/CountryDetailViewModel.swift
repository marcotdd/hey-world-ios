import Foundation

final class CountryDetailViewModel: ObservableObject {
    @Published var state: ViewModelState = .initial
    @Published var country: CountryDetailed
    
    let title: String
    
    init(country: CountryProtocol) {
        self.title = country.name
        self.state = .success
        self.country = CountryDetailed.mokedElement
    }
}
