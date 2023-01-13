import Foundation
import Combine

class Fetcher<Q: GraphQLQuery, Output>: ObservableObject {
    @Published var state: FetcherState<Q, Output>
    
    private var query: Q
    private var extract: (Q.Data) -> Output?
    
    private var bag = Set<AnyCancellable>()
    private var storedData: Output?
    
    init(query: Q, extract: @escaping ((Q.Data) -> Output?)) {
        self.state = .initial
        self.query = query
        self.extract = extract
        
        self.$state.sink { state in
            switch state {
            case .success(let data):
                self.storedData = data

            default:
                break
            }
        }.store(in: &bag)
    }
    
    private func runQuery() {
        print(query)
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                guard let graphQLData = graphQLResult.data, let data = self.extract(graphQLData) else {
                    self.state = .failure(FetcherError.dataExtractionFailed)
                    return
                }

                self.state = .success(data)
                
            case .failure(let error):
                self.state = .failure(error)
            }
        }
    }
    
    func fetch() {
        switch state {
        case .loading:
            break

        case .initial, .failure, .success:
            state = .loading
            runQuery()
        }
    }
    
//    func refresh() {
//        switch state {
//        case .failure, .success:
//            state = .refreshing
//            runQuery()
//
//        default:
//        }
//    }
}

extension Fetcher {
    enum FetcherState<Q: GraphQLQuery, Output> {
        case initial
        case loading
        case success(Output)
        case failure(Error)
    }
    
    enum FetcherError: String, LocalizedError {
        case dataExtractionFailed = "Unable to extract data from graphQL"

        var errorDescription: String {
            return rawValue
        }
    }
}
