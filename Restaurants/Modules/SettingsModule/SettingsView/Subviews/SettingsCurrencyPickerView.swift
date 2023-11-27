import UIKit

protocol SettingsCurrencyDelegate: AnyObject {
    func set(currency: String)
}

final class SettingsCurrencyPickerView: UIPickerView {
    
    // MARK: Properties
    
    weak var settingsCurrencyDelegate: SettingsCurrencyDelegate?
    private var data: [String] = []
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBehaviour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    func configure(with data: [String]) {
        self.data = data
        self.reloadAllComponents()
    }
}

// MARK: - SetupBehaviour

private extension SettingsCurrencyPickerView {
    func setupBehaviour() {
        delegate = self
        dataSource = self
    }
}

// MARK: - UIPickerViewDelegate

extension SettingsCurrencyPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingsCurrencyDelegate?.set(currency: data[row])
    }
}

// MARK: - UIPickerViewDataSource

extension SettingsCurrencyPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
}
