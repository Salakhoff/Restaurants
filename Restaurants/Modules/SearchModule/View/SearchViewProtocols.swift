
import Foundation

protocol SearchViewOutput: AnyObject {
    func didSearch(with text: String)
}

protocol SearchViewInput: AnyObject {}
