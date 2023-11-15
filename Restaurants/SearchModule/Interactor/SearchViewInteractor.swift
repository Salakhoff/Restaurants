
import Foundation

final class SearchViewInteractor {
    
    // MARK: Properties
    
    weak var output: SearchViewInteractorOutput?
    
    // TODO: Инициализация сервиса
    init() {}
}

// MARK: - Input

extension SearchViewInteractor: SearchViewInteractorInput {
    
    func obtainDataFailed(with error: Error) {
        // Заверщено с ошибкой
    }
    
    func obtainData(with text: String) {
        // TODO: Запрос на сервер и передача ответа в презентер
    }
}
