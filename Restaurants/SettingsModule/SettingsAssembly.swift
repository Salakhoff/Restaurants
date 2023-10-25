import UIKit

final class SettingsAssembly {
    
    static func build() -> UIViewController {
        let view = SettingsView()
        let interactor = SettingsInteractor()
    
        let presenter = SettingsPresenter(
            view: view,
            interactor: interactor
        )
        
        view.output = presenter
        interactor.output = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}
