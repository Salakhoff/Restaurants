import UIKit

final class DetailView: UIViewController {
    
    // MARK: Outlets
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
            guard let sectionType = SectionType(rawValue: section) else { return nil }
            
            return createLayoutSection(for: sectionType)
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupAppearance()
        setupLayout()
        setupBehaviour()
        registerCell()
    }
}

// MARK: - EmbedViews

private extension DetailView {
    func embedViews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
    }
}

// MARK: - SetupAppearance

private extension DetailView {
    func setupAppearance() {
        title = "Detail info"
        view.backgroundColor = .white
        
        collectionView.backgroundColor = .white
    }
}

// MARK: - SetupLayout

private extension DetailView {
    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - SetupBehaviour

private extension DetailView {
    func setupBehaviour() {
        collectionView.dataSource = self
    }
}

// MARK: - RegisterCell

private extension DetailView {
    func registerCell() {
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: CellIdentifier.photo.rawValue)
        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: CellIdentifier.information.rawValue)
        collectionView.register(ContactButtonsCell.self, forCellWithReuseIdentifier: CellIdentifier.contact.rawValue)
        collectionView.register(FavoriteButtonCell.self, forCellWithReuseIdentifier: CellIdentifier.favorite.rawValue)
        collectionView.register(ReviewsCell.self, forCellWithReuseIdentifier: CellIdentifier.review.rawValue)
    }
}

// MARK: - UICollectionViewDataSource

extension DetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .photo:
            return 1
        case .information:
            return 1
        case .contact:
            return 1
        case .favorite:
            return 1
        case .reviews:
            return 4
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .photo:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CellIdentifier.photo.rawValue,
                for: indexPath
            ) as? PhotoCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(named: "simple")
            
            return cell
            
        case .information:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CellIdentifier.information.rawValue,
                for: indexPath
            ) as? InfoCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(
                nameRestaurant: "Name of restaurant",
                description: "Pago Restaurant is a new dining experience concept serving authentic Indonesian, Asian and Western specialties. Open for breakfast, lunch, and dinner, this restaurant offers extensive buffet and a la carte options.",
                price: "Average bill: $65,000 - $250,00"
            )
            
            return cell
            
        case .contact:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CellIdentifier.contact.rawValue,
                for: indexPath
            ) as? ContactButtonsCell else {
                return UICollectionViewCell()
            }
            
            return cell
            
        case .favorite:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CellIdentifier.favorite.rawValue,
                for: indexPath
            ) as? FavoriteButtonCell else {
                return UICollectionViewCell()
            }
            
            return cell
            
        case .reviews:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CellIdentifier.review.rawValue,
                for: indexPath
            ) as? ReviewsCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(
                nick: "Wander \(indexPath.item)",
                title: "Bteakfast",
                description: "The service & the taste of the food was amazing, the ambience, music was so good. Definetely will be back. Thank you Pago Restaurant!💛",
                data: "June 30, 2023"
            )
            
            return cell
        }
    }
}

// MARK: - Section Creation

private extension DetailView {
    static func createLayoutSection(for sectionType: SectionType) -> NSCollectionLayoutSection {
        switch sectionType {
        case .photo:
            return createPhotoSection()
        case .information:
            return createInfoSection()
        case .contact:
            return createButtonsContactSection()
        case .favorite:
            return createButtonAddFavoriteSection()
        case .reviews:
            return createReviewsSection()
        }
    }
    
    static func createPhotoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(250)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.bottom = 10
        
        return section
    }
    
    static func createInfoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.bottom = 10
        
        return section
    }
    
    static func createButtonsContactSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(50)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.bottom = 10
        
        return section
    }
    
    static func createButtonAddFavoriteSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(60)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.bottom = 30
        
        return section
    }
    
    static func createReviewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(30)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(30)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

// MARK: - SectionType

private extension DetailView {
    enum SectionType: Int, CaseIterable {
        case photo
        case information
        case contact
        case favorite
        case reviews
    }
}
