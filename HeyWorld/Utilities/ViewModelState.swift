import Foundation

enum ViewModelState {
    case initial
    case loading
    case success
    case failure(HeyWorldError)
}
