import Foundation

final class SettingsInteractor: SettingsInteractorInput {
    
    weak var output: SettingsInteractorOutput?
    
    func getCurrencyData() -> [String] {
        // FIXME: Тут мы делаем запрос в сеть для получение валюты
        let currencyData = ["USD", "EUR", "GBP"]
        return currencyData
    }
    
    func getLanguageData() -> [String] {
        // FIXME: Тут мы делаем запрос в сеть для получение языков
        let languageData = ["English", "Spanish", "French"]
        return languageData
    }
}
