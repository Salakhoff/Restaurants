import Foundation

final class FavoritesPresenter {
    
    // MARK: Properties
    
    weak var view: FavoritesViewInput?
    var interactor: FavoritesInteractorInput?
    
    // MARK: Init
    
    init(
        view: FavoritesViewInput,
        interactor: FavoritesInteractorInput
    ) {
        self.view = view
        self.interactor = interactor
    }
}

extension FavoritesPresenter: FavoritesViewOutput {
    func viewDidLoad() {
        interactor?.getFavoriteRestaurants()
    }
}

extension FavoritesPresenter: FavoritesInteractorOutput {
    func didFetchFavoriteRestaurants(_ restaurants: [Restaurant]) {
        view?.updateViewState(.nonEmpty)
        view?.displayFavoriteRestaurants(restaurants)
    }
    
    func fetchFailed(with error: String) {
        view?.updateViewState(.empty)
        view?.displayError(error)
    }
}
