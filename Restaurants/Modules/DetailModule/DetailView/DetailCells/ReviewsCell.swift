import UIKit

final class ReviewsCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    private let nickLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let dataLabel = UILabel()
    private let stackView = UIStackView(
        axis: .vertical,
        spacing: 10
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
        nick: String,
        title: String,
        description: String,
        data: String
    ) {
        nickLabel.text = nick
        titleLabel.text = title
        descriptionLabel.text = description
        dataLabel.text = data
    }
}

// MARK: - SetupAppearance

private extension ReviewsCell {
    func setupAppearance() {
        contentView.backgroundColor = .white
        
        nickLabel.textColor = UIColor(
            red: 103/255,
            green: 104/255,
            blue: 109/255,
            alpha: 1
        )
        nickLabel.font = .robotoRegular(fontSize: 17)
        
        titleLabel.textColor = .black
        titleLabel.font = .robotoBold(fontSize: 17)
        titleLabel.numberOfLines = countLines(of: titleLabel, maxHeight: 20)
        
        descriptionLabel.textColor = .black
        descriptionLabel.font = .robotoRegular(fontSize: 17)
        descriptionLabel.numberOfLines = countLines(of: descriptionLabel, maxHeight: 100)
        
        dataLabel.textColor = UIColor(
            red: 185/255,
            green: 188/255,
            blue: 190/255,
            alpha: 1
        )
        dataLabel.font = .robotoRegular(fontSize: 12)
    }
}

// MARK: - EmbedViews

private extension ReviewsCell {
    func embedViews() {
        let subviews = [
            nickLabel,
            titleLabel,
            descriptionLabel,
            dataLabel,
            stackView
        ]
        
        subviews.disableAutoresizingMask()
        
        stackView.addArrangedSubview(nickLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
       
        contentView.addSubview(dataLabel)
        contentView.addSubview(stackView)
    }
}

// MARK: - SetupLayout

private extension ReviewsCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
        ])
    }
}

// MARK: - CountLinesLabel

private extension ReviewsCell {
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
