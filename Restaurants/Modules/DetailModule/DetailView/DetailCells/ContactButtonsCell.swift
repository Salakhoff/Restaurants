import UIKit

final class ContactButtonsCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    private let phoneButton = UIButton()
    private let webButton = UIButton()
    private let menuButton = UIButton()
    private let stackView = UIStackView(
        axis: .horizontal,
        distribution: .fillEqually,
        alignment: .center,
        spacing: 20
    )
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        embedViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupAppearance

private extension ContactButtonsCell {
    func setupAppearance() {
        contentView.backgroundColor = .white
        
        phoneButton.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        webButton.setImage(UIImage(systemName: "network"), for: .normal)
        menuButton.setImage(UIImage(systemName: "book"), for: .normal)
        
        phoneButton.imageView?.contentMode = .scaleAspectFit
        webButton.imageView?.contentMode = .scaleAspectFit
        menuButton.imageView?.contentMode = .scaleAspectFit
        
        phoneButton.contentHorizontalAlignment = .fill
        phoneButton.contentVerticalAlignment = .fill
        
        webButton.contentHorizontalAlignment = .fill
        webButton.contentVerticalAlignment = .fill
        
        menuButton.contentHorizontalAlignment = .fill
        menuButton.contentVerticalAlignment = .fill
        
        phoneButton.isUserInteractionEnabled = true
        webButton.isUserInteractionEnabled = true
        menuButton.isUserInteractionEnabled = true
    }
}

// MARK: - EmbedViews

private extension ContactButtonsCell {
    func embedViews() {
        let subviews = [
            phoneButton,
            webButton,
            menuButton,
            stackView
        ]
        
        subviews.disableAutoresizingMask()
        
        stackView.addArrangedSubview(phoneButton)
        stackView.addArrangedSubview(webButton)
        stackView.addArrangedSubview(menuButton)
    
        contentView.addSubview(stackView)
    }
}

// MARK: - SetupLayout

private extension ContactButtonsCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            phoneButton.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            phoneButton.widthAnchor.constraint(equalTo: phoneButton.heightAnchor),
            
            webButton.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            webButton.widthAnchor.constraint(equalTo: webButton.heightAnchor),
            
            menuButton.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            menuButton.widthAnchor.constraint(equalTo: menuButton.heightAnchor)
        ])
    }
}
