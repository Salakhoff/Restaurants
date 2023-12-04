import Foundation

protocol FavoritesViewInput: AnyObject {
    
    func displayFavoriteRestaurants(_ restaurants: [Restaurant])
    func displayError(_ message: String)
    
    func updateViewState(_ state: SavedViewState)
}

protocol FavoritesViewOutput {
    func viewDidLoad()
}
