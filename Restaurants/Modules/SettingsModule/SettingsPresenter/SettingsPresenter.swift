import Foundation

final class SettingsPresenter {
    
    // MARK: Properties
    
    weak var view: SettingsViewInput?
    let interactor: SettingsInteractorInput
    
    // MARK: Init
    
    init(view: SettingsViewInput, interactor: SettingsInteractorInput) {
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {
    func didTapCurrencyTextField() {
        view?.configureCurrencyPickerView(with: interactor.getCurrencyData())
    }
    
    func didTapLanguageTextField() {
        view?.configureLanguagePickerView(with: interactor.getLanguageData())
    }
}

// MARK: - SettingsInteractorOutput

extension SettingsPresenter: SettingsInteractorOutput {}
