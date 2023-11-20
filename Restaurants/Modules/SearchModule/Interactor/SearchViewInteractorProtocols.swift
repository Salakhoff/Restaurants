
import Foundation

protocol SearchViewInteractorInput: AnyObject {
    func obtainData(with text: String)
    func obtainDataFailed(with error: Error)
}

protocol SearchViewInteractorOutput: AnyObject {
    func citiesListRespond()
}
