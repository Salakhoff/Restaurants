import Foundation

protocol SettingsViewInput: AnyObject {
    var output: SettingsViewOutput? { get set }
    
    func configureCurrencyPickerView(with data: [String])
    func configureLanguagePickerView(with data: [String])
}

protocol SettingsViewOutput: AnyObject {
    func didTapCurrencyTextField()
    func didTapLanguageTextField()
}
