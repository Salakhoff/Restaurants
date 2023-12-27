import UIKit

final class InfoCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    private let nameRestaurantLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let bacgroundForDescriptionView = UIView()
    private let stackView = UIStackView(
        axis: .vertical,
        spacing: 12
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
    
    // MARK: Configure
    
    func configure(
        nameRestaurant: String,
        description: String,
        price: String
    ) {
        nameRestaurantLabel.text = nameRestaurant
        descriptionLabel.text = description
        priceLabel.text = price
    }
}

// MARK: - SetupAppearance

private extension InfoCell {
    func setupAppearance() {
        contentView.backgroundColor = .white
        
        nameRestaurantLabel.font = UIFont.poppinsSemiBold(fontSize: 25)
        nameRestaurantLabel.numberOfLines = 2
        nameRestaurantLabel.minimumScaleFactor = 0.5
        nameRestaurantLabel.adjustsFontSizeToFitWidth = true
        nameRestaurantLabel.textColor = .black
        
        priceLabel.font = UIFont.poppinsSemiBold(fontSize: 15)
        priceLabel.textColor = .black
        
        descriptionLabel.font = .poppinsSemiBold(fontSize: 15)
        descriptionLabel.textColor = .black
        
        bacgroundForDescriptionView.backgroundColor = UIColor(
            red: 242/255,
            green: 206/255,
            blue: 206/255,
            alpha: 1
        )
        
        bacgroundForDescriptionView.layer.cornerRadius = 10
        
        descriptionLabel.numberOfLines =  countLines(of: descriptionLabel, maxHeight: 300)
        descriptionLabel.layer.shadowColor = UIColor.black.cgColor
        descriptionLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
        descriptionLabel.layer.shadowOpacity = 0.25
        descriptionLabel.layer.shadowRadius = 4
    }
}

// MARK: - EmbedViews

private extension InfoCell {
    func embedViews() {
        let subviews = [
            bacgroundForDescriptionView,
            nameRestaurantLabel,
            priceLabel,
            descriptionLabel, stackView
        ]
        
        subviews.disableAutoresizingMask()
        
        stackView.addArrangedSubview(nameRestaurantLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(bacgroundForDescriptionView)
        bacgroundForDescriptionView.addSubview(descriptionLabel)
    
        contentView.addSubview(stackView)
    }
}

// MARK: - SetupLayout

private extension InfoCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: bacgroundForDescriptionView.topAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: bacgroundForDescriptionView.leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: bacgroundForDescriptionView.trailingAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bacgroundForDescriptionView.bottomAnchor, constant: -5),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

// MARK: - CountLinesLabel

private extension InfoCell {
    func countLines(of label: UILabel, maxHeight: CGFloat) -> Int {
        guard let labelText = label.text else {
            return 0
        }
        
        let rect = CGSize(width: label.bounds.width, height: maxHeight)
        let labelSize = labelText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font!], context: nil)
        
        let lines = Int(ceil(CGFloat(labelSize.height) / label.font.lineHeight))
        return labelText.contains("\n") && lines == 1 ? lines + 1 : lines
    }
}
