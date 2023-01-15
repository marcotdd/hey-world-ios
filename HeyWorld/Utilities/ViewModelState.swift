import Foundation

enum ViewModelState {
    case initial
    case loading
    case success
    case failure(HeyWorldError)
}

extension ViewModelState: Equatable {
    static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true

        case (.success, .success):
            return true
            
        case (.failure, .failure):
            return true
            
        default:
            return false
        }
    }
}
