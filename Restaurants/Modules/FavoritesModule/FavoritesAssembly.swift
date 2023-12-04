import UIKit

final class FavoritesAssembly {
    
    static func build() -> UIViewController {
        let view = FavoritesView()
        let interactor = FavoritesInteractor()
        
        let presenter = FavoritesPresenter(
            view: view,
            interactor: interactor
        )
        
        view.output = presenter
        interactor.output = presenter
        
        return view
    }
}
