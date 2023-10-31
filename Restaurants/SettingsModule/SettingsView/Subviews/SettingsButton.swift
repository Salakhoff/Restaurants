import UIKit

final class SettingsButton: UIButton {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(type: .system)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupAppearance
private extension SettingsButton {
    func setupAppearance() {
        setTitleColor(.systemBackground, for: .normal)
        setTitle("Save", for: .normal)
        // FIXME: Установить корректный шрифт
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        backgroundColor = Metric.buttonBackgroundColor
    
        layer.shadowColor = Metric.buttonShadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 20
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric
private extension SettingsButton {
    enum Metric {
        static let buttonBackgroundColor: UIColor = UIColor(
            red: 31/255.0,
            green: 65/255.0,
            blue: 187/255.0,
            alpha: 1.0
        )
        static let buttonShadowColor: UIColor = UIColor(
            red: 203/255.0,
            green: 214/255.0,
            blue: 255/255.0,
            alpha: 1.0
        )
    }
}
