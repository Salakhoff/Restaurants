
import UIKit

final class SearchViewAssembly {

    static func build() -> UIViewController {
        let view = SearchViewController()
        let interactor = SearchViewInteractor()

        let presenter = SearchViewPresenter(
            view: view,
            interactor: interactor
        )

        view.output = presenter
        interactor.output = presenter

        return view
    }
}

