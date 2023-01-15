import SwiftUI

struct CountryListView: View {
    // MARK: - Properties
    
    @StateObject var viewModel: CountryListViewModel = CountryListViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .initial:
                    Color.clear.onAppear {
                        Task {
                            await viewModel.fetch()
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
                    if !viewModel.countries.isEmpty {
                        countriesView()
                    } else {
                        EmptyView {
                            Text("No countries available")
                        }.refreshable {
                            await viewModel.refresh()
                        }
                    }
                }
            }
            .navigationTitle("World Countries")
        }
    }
    
    // MARK: - Sub-Views
    
    private func countriesView() -> some View {
        VStack {
            List(viewModel.countries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    CountryListRowView(country: country)
                }
            }
            .listStyle(.plain)
            .refreshable {
                await viewModel.refresh()
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
