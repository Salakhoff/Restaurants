import UIKit

final class RestaurantCell: UITableViewCell {
    
    // MARK: Outlets
    
    private let nameRestaurantLabel = UILabel()
    private let restaurantImageView = UIImageView()
    
    // MARK: LiceCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setContentViewInsets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Update Value
    
    func updateValue(_ restaurant: Restaurant) {
        restaurantImageView.image = restaurant.image
        nameRestaurantLabel.text = restaurant.name
    }
}

// MARK: - EmbedViews

private extension RestaurantCell {
    func embedViews() {
        let subviews = [restaurantImageView, nameRestaurantLabel]
        
        subviews.disableAutoresizingMask()
        
        contentView.addSubviews(
            restaurantImageView,
            nameRestaurantLabel
        )
    }
}

// MARK: - SetupLayout

private extension RestaurantCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            restaurantImageView.widthAnchor.constraint(equalTo: restaurantImageView.heightAnchor),
            
            nameRestaurantLabel.centerYAnchor.constraint(equalTo: restaurantImageView.centerYAnchor),
            nameRestaurantLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameRestaurantLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 15)
        ])
    }
}

// MARK: - SetupAppearance

private extension RestaurantCell {
    func setupAppearance() {
        backgroundColor = .white
        
        contentView.backgroundColor = UIColor(
            red: 242/255.0,
            green: 206/255.0,
            blue: 206/255.0,
            alpha: 1
        )
        
        contentView.layer.cornerRadius = 30
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowOpacity = 0.25
        contentView.layer.shadowRadius = 4
        
        nameRestaurantLabel.font = UIFont.poppinsMedium(fontSize: 12)
        nameRestaurantLabel.numberOfLines = 0
        nameRestaurantLabel.textColor = .black
 
        restaurantImageView.layer.cornerRadius = 30
        restaurantImageView.contentMode = .scaleAspectFit
        restaurantImageView.clipsToBounds = true
    }
}

// MARK: - SetContentViewInsets

private extension RestaurantCell {
    func setContentViewInsets() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
}
