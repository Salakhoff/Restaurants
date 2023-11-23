import UIKit

final class SettingsTextField: UITextField {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 20, dy: 0)
    }
}

// MARK: - SetupAppearance
private extension SettingsTextField {
    func setupAppearance() {
        borderStyle = .roundedRect
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 48
        layer.shadowOpacity = 0.2
        layer.masksToBounds = true
    }
}
