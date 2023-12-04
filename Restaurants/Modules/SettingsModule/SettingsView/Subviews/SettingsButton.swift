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
        titleLabel?.font = UIFont.poppinsBold(fontSize: 20)
        backgroundColor = UIColor(
            red: 31/255.0,
            green: 65/255.0,
            blue: 187/255.0,
            alpha: 1.0
        )
        
        layer.cornerRadius = 10
        
        overrideUserInterfaceStyle = .light
        
        makeButtonShadow()
    }
}
