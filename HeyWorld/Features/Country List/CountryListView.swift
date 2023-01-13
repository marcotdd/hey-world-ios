import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel: CountryListViewModel = CountryListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .initial:
                    Color.clear.onAppear(perform: viewModel.fetch)
                    
                case .loading:
                    ProgressView()
                    
                case .failure(let error):
                    ErrorView(error: error)
                        .refreshable {
                            viewModel.refresh()
                        }
                    
                case .success:
                    content
                }
            }
            .navigationTitle("World Countries")
        }
    }
    
    private var content: some View {
        VStack {
            List(viewModel.countries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    CountryListRowView(country: country)
                }
            }
            .listStyle(.plain)
            .refreshable {
                viewModel.refresh()
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
