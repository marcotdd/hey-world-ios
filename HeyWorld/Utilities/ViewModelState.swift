import Foundation

enum ViewModelState {
    /// State of the `ViewModel` when we initialize it (no query has been started yet).
    case initial
    
    /// State of the `ViewModel` when we have at least one ongoing query.
    case loading
    
    /// State of the `ViewModel` when the query succeeds
    case success
    
    /// State of the `ViewModel` when an error has occured in one of the queries.
    /// - parameter error: The error returned by the query that failed.
    case failure(Error)
}
