import UIKit

final class SettingsStackView: UIStackView {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupAppearance
private extension SettingsStackView {
    func setupAppearance() {
        axis = .vertical
        spacing = 35
        distribution = .fillEqually
        alignment = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
