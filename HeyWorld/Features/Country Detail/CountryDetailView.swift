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
                Color.clear.onAppear {
                    Task {
                        await viewModel.fetchAA()
                    }
                }
                
            case .loading:
                ProgressView()
                
            case .failure(let error):
                ErrorView(error: error)
                    .refreshable {
                        await viewModel.refresh()
                    }
                
            case .success:
                if let country = viewModel.country {
                    countryDetailView(country: country)
                } else {
                    EmptyView {
                        Text("Selected country not available")
                    }.refreshable {
                        await viewModel.refresh()
                    }
                }
            }
        }
        .navigationTitle(viewModel.title)
    }
    
    // MARK: - Sub-Views
    
    private func countryDetailView(country: CountryDetailed) -> some View {
        ScrollView {
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
        .refreshable {
            await viewModel.refresh()
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: CountryLight(code: "JP", flag: "🇯🇵", name: "Japan"))
    }
}
