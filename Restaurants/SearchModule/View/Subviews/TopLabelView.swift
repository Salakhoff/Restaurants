
import UIKit

final class TopLabelView: UIView {
    
    private var image = UIImageView(image: UIImage(
        named: Constants.Strings.imageName
    ))
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Embed Views

private extension TopLabelView {
    
    func embedViews() {
        [image, textLabel].forEach { addSubview($0) }
    }
}

// MARK: - Setup Layout

private extension TopLabelView {
    
    func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Metric.titleTextTopOffset),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: Constants.Metric.titleTextWidth)
        ])
    }
}

// MARK: - Setup Appearance

private extension TopLabelView {
    
    func setupAppearance() {
        image = UIImageView(image: UIImage(
            named: Constants.Strings.imageName
        ))
        
        textLabel.text = Constants.Strings.titleText
        textLabel.font = Constants.Fonts.titleTextFontLabel
        textLabel.textColor = UIColor(cgColor: Constants.Colors.titleTextColor)
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
    }
}

// MARK: - Constants

private extension TopLabelView {
    
    enum Constants {
        enum Strings {
            static let imageName: String = "RestarauntImage"
            static let titleText: String = "Stop looking for a restauraunt - find it."
        }
        
        enum Colors {
            static let titleTextColor: CGColor = CGColor(
                red: 0.95,
                green: 0.81,
                blue: 0.81,
                alpha: 1
            )
        }
        
        enum Fonts {
            static let titleTextFontLabel: UIFont = UIFont(
                name: "Inter-SemiBold",
                size: 24)
            ?? .boldSystemFont(ofSize: 24)
        }
        
        enum Metric {
            static let titleTextWidth: CGFloat = 300
            static let titleTextTopOffset: CGFloat = 56
        }
    }
}
