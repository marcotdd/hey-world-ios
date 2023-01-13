import SwiftUI

struct CountryDetailView: View {
    // MARK: - Properties
    
    @StateObject var viewModel: CountryDetailViewModel
    
    // MARK: - Initializer
    
    init(country: CountryProtocol) {
        _viewModel = StateObject(wrappedValue: CountryDetailViewModel(country: country))
    }
    
    // MARK: - Body
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .initial:
                Color.clear.onAppear(perform: viewModel.fetch)
                
            case .loading:
                ProgressView()
                
            case .failure(let error):
                ErrorView(error: error)
                
            case .success:
                content
            }
        }
        .navigationTitle(viewModel.title)
    }
    
    // MARK: - Sub-Views
    
    private var content: some View {
        ScrollView {
            if let country = viewModel.country {
                VStack(alignment: .leading) {
                    HStack {
                        Text(country.flag)
                        Text(country.native)
                    }
                    .font(.title)
                    .padding(.vertical, 4)
                    
                    CountryDetailElementView(label: "Code", value: country.code)
                    
                    if let capital = country.capital {
                        CountryDetailElementView(label: "Capital", value: capital)
                    }
                    
                    CountryDetailElementView(label: "Continent", value: country.continent.name)
                    CountryDetailElementView(label: "Telephone Prefix", value: country.phone)
                    
                    if let currency = country.currency {
                        CountryDetailElementView(label: "Currency", value: currency)
                    }
                    
                    if let languages = viewModel.formattedLanguages {
                        CountryDetailElementView(label: "Languages", value: languages)
                    }
                }
                .padding(.horizontal)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: CountryLight(code: "JP", flag: "🇯🇵", name: "Japan"))
    }
}
