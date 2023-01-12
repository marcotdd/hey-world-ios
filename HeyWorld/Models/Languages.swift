import Foundation

struct Language {
    let id: String = UUID().uuidString
    let code: String
    let name: String?
    let native: String?
}
