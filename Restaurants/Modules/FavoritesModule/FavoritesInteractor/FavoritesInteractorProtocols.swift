import Foundation

protocol FavoritesInteractorInput {
    
    func getFavoriteRestaurants()
    
}

protocol FavoritesInteractorOutput: AnyObject {
    func didFetchFavoriteRestaurants(_ restaurants: [Restaurant])
    func fetchFailed(with error: String)
}
