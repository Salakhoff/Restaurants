
import Foundation

final class SearchViewPresenter {
    
    // MARK: Properties
    
    weak var view: SearchViewInput?
    var interactor: SearchViewInteractorInput?
    
    // MARK: Init
    
    init(
        view: SearchViewInput,
        interactor: SearchViewInteractorInput
    ) {
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - Output

extension SearchViewPresenter: SearchViewOutput {
    
    func didSearch(with text: String) {
        print(#function)
        interactor?.obtainData(with: text)
    }
}

extension SearchViewPresenter: SearchViewInteractorOutput {
    
    func citiesListRespond() {
        // TODO: - ответ от интерактора и передача во view
    }
}

