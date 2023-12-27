import UIKit

final class FavoriteButtonCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    private let favoriteButton = UIButton()
    
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

private extension FavoriteButtonCell {
    func setupAppearance() {
        contentView.backgroundColor = .white
        
        favoriteButton.backgroundColor = UIColor(
            red: 31/255,
            green: 65/255,
            blue: 187/255,
            alpha: 1
        )
        
        favoriteButton.setTitle("Add to favorites +", for: .normal)
        favoriteButton.titleLabel?.font = .poppinsRegular(fontSize: 20)
        favoriteButton.layer.cornerRadius = 10
        favoriteButton.layer.shadowColor = UIColor.black.cgColor
        favoriteButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        favoriteButton.layer.shadowOpacity = 0.3
        favoriteButton.layer.shadowRadius = 4
    }
}

// MARK: - EmbedViews

private extension FavoriteButtonCell {
    func embedViews() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(favoriteButton)
    }
}

// MARK: - SetupLayout

private extension FavoriteButtonCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            favoriteButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            favoriteButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
