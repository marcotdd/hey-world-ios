import Foundation

final class CountryListFetcher: Fetcher<SchemaGraphQL.GetCountriesQuery, [CountryLight]> {
    init() {
        super.init(query: SchemaGraphQL.GetCountriesQuery()) { data in
            CountryLight.toArray(data.countries)
        }
    }
}
