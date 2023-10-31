import Foundation

protocol SettingsInteractorInput {
    
    var output: SettingsInteractorOutput? { get set }
    
    func getCurrencyData() -> [String]
    func getLanguageData() -> [String]
}

protocol SettingsInteractorOutput: AnyObject {}
