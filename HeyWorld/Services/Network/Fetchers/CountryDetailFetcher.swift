import Foundation

final class CountryDetailFetcher: Fetcher<SchemaGraphQL.GetCountryDetailQuery, CountryDetailed> {
    init(code: String) {
        super.init(query: SchemaGraphQL.GetCountryDetailQuery(code: SchemaGraphQL.ID(stringLiteral: code))) { result in
            guard let country = result.country else {
                return nil
            }
            
            return CountryDetailed(country)
        }
    }
}
