import UIKit

protocol SettingsLanguageDelegate: AnyObject {
    func set(language: String)
}

final class SettingsLanguagePickerView: UIPickerView {
    
    // MARK: Properties
    weak var settingsLanguageDelegate: SettingsLanguageDelegate?
    private var data: [String] = []
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBehaviour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    func configure(with data: [String]) {
        self.data = data
        self.reloadAllComponents()
    }
}

// MARK: - SetupBehaviour
private extension SettingsLanguagePickerView {
    func setupBehaviour() {
        delegate = self
        dataSource = self
    }
}


// MARK: - UIPickerViewDelegate
extension SettingsLanguagePickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value = data[row]
        settingsLanguageDelegate?.set(language: value)
    }
}

// MARK: - UIPickerViewDataSource
extension SettingsLanguagePickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
}
