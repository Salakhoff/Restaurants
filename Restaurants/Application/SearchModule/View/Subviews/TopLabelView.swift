//
//  TopLabelView.swift
//  Restaurants
//
//  Created by Павел Дубинин on 31.10.2023.
//

import UIKit

final class TopLabelView: UIView {
    
    private var image = UIImageView(image: UIImage(named: Constants.imageName))
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
        textLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Layout

private extension TopLabelView {
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 56),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

// MARK: - Setup Appearance

private extension TopLabelView {
    
    func setupAppearance() {
        image = UIImageView(image: UIImage(named: Constants.imageName))
        
        textLabel.text = Constants.text
        textLabel.font = Constants.fontTextLabel
        textLabel.textColor = UIColor(cgColor: Constants.textColor)
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
    }
}

// MARK: - Constants

private extension TopLabelView {
    
    enum Constants {
        static let imageName: String = "RestarauntImage"
        static let text: String = "Stop looking for a restauraunt - find it."
        static let textColor: CGColor = CGColor(red: 0.95,
                                                green: 0.81,
                                                blue: 0.81,
                                                alpha: 1)
        static let fontTextLabel: UIFont = UIFont(name: "Inter-SemiBold",
                                                  size: 24)
                                                  ?? .boldSystemFont(ofSize: 24)
    }
}
