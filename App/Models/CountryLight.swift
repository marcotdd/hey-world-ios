import Foundation

struct CountryLight: CountryProtocol, Identifiable {
    let id: String = UUID().uuidString
    let code: String
    let flag: String
    let name: String
}

extension CountryLight {
    static let mokedList: [CountryLight] = [
        CountryLight(code: "ES", flag: "🇪🇸", name: "Spain"),
        CountryLight(code: "IT", flag: "🇮🇹", name: "Italy"),
        CountryLight(code: "JP", flag: "🇯🇵", name: "Japan"),
        CountryLight(code: "TN", flag: "🇹🇳", name: "Tunisia")
    ]
    
    static let mokedElement: CountryLight = CountryLight(code: "ES", flag: "🇪🇸", name: "Spain")
}
