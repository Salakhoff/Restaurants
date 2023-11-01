//
//  SearchViewController.swift
//  Restaurants
//
//  Created by Павел Дубинин on 24.10.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: UI

    private let topLabel = TopLabelView()
    private let searchField = UISearchTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        embedViews()
        setupLayout()
        setupAppearance()
    }
}

// MARK: - Embed Views

private extension SearchViewController {
    
    func embedViews() {
        [
            topLabel,
            searchField,
        ].forEach { view.addSubview($0) }
        //FIXME: переделать после добавления расширений
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Layout

private extension SearchViewController {
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            topLabel.heightAnchor.constraint(equalToConstant: 272),
            
            searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Setup Appearance

private extension SearchViewController {
    
    func setupAppearance() {

    }
    
}



