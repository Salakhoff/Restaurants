import UIKit

final class SettingsView: UIViewController, SettingsViewInput {
    
    // MARK: Properties:
    var output: SettingsViewOutput?
    
    // MARK: Outlets
    private let currencyTextField = SettingsTextField()
    private let languageTextField = SettingsTextField()
    private let saveButton = SettingsButton()
    private let settingsCurrencyPickerView = SettingsCurrencyPickerView()
    private let settingsLanguagePickerView = SettingsLanguagePickerView()
    private let tapGesture = UITapGestureRecognizer()
    
    private let stackView = UIStackView(
        axis: .vertical,
        distribution: .fillEqually,
        alignment: .fill,
        spacing: 35
    )
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupText()
        setupBehaviour()
        addTarget()
    }
    
    // MARK: Actions
    @objc private func handleTap() {
        view.endEditing(true)
    }
    
    // MARK: Methods
    func configureCurrencyPickerView(with data: [String]) {
        settingsCurrencyPickerView.configure(with: data)
    }
    
    func configureLanguagePickerView(with data: [String]) {
        settingsLanguagePickerView.configure(with: data)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case currencyTextField:
            output?.didTapCurrencyTextField()
        case languageTextField:
            output?.didTapLanguageTextField()
        default: break
        }
    }
}

// MARK: - Targets
extension SettingsView {
    private func addTarget() {
        tapGesture.addTarget(self, action: #selector(handleTap))
    }
}

// MARK: - SetupBehaviour
private extension SettingsView {
    func setupBehaviour() {
        currencyTextField.delegate = self
        languageTextField.delegate = self
        settingsCurrencyPickerView.settingsCurrencyDelegate = self
        settingsLanguagePickerView.settingsLanguageDelegate = self
    }
}

// MARK: - SettingsCurrencyDelegate
extension SettingsView: SettingsCurrencyDelegate {
    func set(currency: String) {
        currencyTextField.text = currency
    }
}

// MARK: - SettingsLanguageDelegate
extension SettingsView: SettingsLanguageDelegate {
    func set(language: String) {
        languageTextField.text = language
    }
}

// MARK: - EmbedViews
private extension SettingsView {
    func embedViews() {
        
        let subviews = [
            currencyTextField,
            languageTextField,
            stackView,
            saveButton
        ]
        
        subviews.removeConstraints()
        
        view.addSubviews(stackView, saveButton)
        stackView.addArrangedSubview(currencyTextField)
        stackView.addArrangedSubview(languageTextField)
        view.addGestureRecognizer(tapGesture)
        
        currencyTextField.inputView = settingsCurrencyPickerView
        languageTextField.inputView = settingsLanguagePickerView
    }
}

// MARK: - SetupLayout
private extension SettingsView {
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            currencyTextField.heightAnchor.constraint(equalToConstant: 60),
            languageTextField.heightAnchor.constraint(equalToConstant: 60),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

// MARK: - SetupAppearance
private extension SettingsView {
    func setupAppearance() {
        title = "Settings"
        
        // FIXME: Установить корректный цвет экрана
        view.backgroundColor = .systemGray6
    }
}

// MARK: - SetupText
private extension SettingsView {
    func setupText() {
        currencyTextField.text = "USD"
        languageTextField.text = "English"
    }
}
