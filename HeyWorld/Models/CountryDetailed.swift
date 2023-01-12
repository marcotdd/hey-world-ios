import Foundation

struct CountryDetailed: CountryProtocol {
    let code: String
    let name: String
    let native: String
    let phone: String
    let continent: Continent
    let capital: String?
    let currency: String?
    let languages: [Language]
    let flag: String
}

extension CountryDetailed {
    static let mokedElement = CountryDetailed(
        code: "JP",
        name: "Japan",
        native: "日本",
        phone: "81",
        continent: Continent(code: "AS", name: "Asia"),
        capital: "Tokyo",
        currency: "JPY",
        languages: [Language(code: "ja", name: "Japanese", native: "日本語")],
        flag: "🇯🇵"
    )
}
