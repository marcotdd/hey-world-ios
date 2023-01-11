import SwiftUI

struct CountryDetailView: View {
    @StateObject var viewModel: CountryDetailViewModel
    
    init(country: CountryProtocol) {
        _viewModel = StateObject(wrappedValue: CountryDetailViewModel(country: country))
    }
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .initial, .loading:
                ProgressView()
                
            case .failure(let error):
                // TODO: Handle error view
                Text(error.localizedDescription)
                
            case .success:
                content
            }
        }
        .navigationTitle(viewModel.title)
    }
    
    private var content: some View {
        VStack {
            Text(viewModel.country.name)
        }
        .navigationTitle(viewModel.country.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: CountryLight(code: "JP", flag: "🇯🇵", name: "Japan"))
    }
}
