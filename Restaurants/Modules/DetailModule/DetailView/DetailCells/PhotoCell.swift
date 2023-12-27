import UIKit

final class PhotoCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    private var restaurantImageView = UIImageView()
    
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
    
    // MARK: Configure
    
    func configure(named: String) {
        restaurantImageView.image = UIImage(named: named)
    }
}

// MARK: - SetupAppearance

private extension PhotoCell {
    func setupAppearance() {
        contentView.backgroundColor = .white
        
        restaurantImageView.contentMode = .scaleAspectFill
    }
}

// MARK: - EmbedViews

private extension PhotoCell {
    func embedViews() {
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(restaurantImageView)
    }
}

// MARK: - SetupLayout

private extension PhotoCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            restaurantImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
