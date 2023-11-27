import UIKit

final class FavoritesInteractor: FavoritesInteractorInput {
    
    // MARK: Properties:
    
    weak var output: FavoritesInteractorOutput?
    
    // MARK: - Data Retrieval
    
    func getFavoriteRestaurants() {
        //  FIXME: Тут нужно сделать запрос в БД
        let restaurants: [Restaurant] = [

        ]
        
        guard !restaurants.isEmpty else {
            output?.fetchFailed(with: "Нет избранных ресторанов.\nДобавьте, чтобы сохранить.")
            return
        }
        
        output?.didFetchFavoriteRestaurants(restaurants)
    }
}
