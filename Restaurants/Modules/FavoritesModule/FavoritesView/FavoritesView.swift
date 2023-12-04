import UIKit

final class FavoritesView: UIViewController, FavoritesViewInput {
    
    // MARK: Properties:
    
    var output: FavoritesViewOutput?
    private var favoriteRestaurants: [Restaurant] = []
    
    // MARK: Outlets
    
    private let restaurantsTableView = UITableView()
    private let emptyRestaurantsLabel = UILabel()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidLoad()
        
        embedViews()
        setupAppearance()
        setupLayout()
        setupBehaviour()
        registerCell()
    }
    
    // MARK: - View Methods
    
    func displayFavoriteRestaurants(_ restaurants: [Restaurant]) {
        favoriteRestaurants = restaurants
    }
    
    func displayError(_ message: String) {
        emptyRestaurantsLabel.text = message
    }
    
    func updateViewState(_ state: SavedViewState) {
        switch state {
        case .empty:
            restaurantsTableView.isHidden = true
            emptyRestaurantsLabel.isHidden = false
        case .nonEmpty:
            emptyRestaurantsLabel.isHidden = true
            restaurantsTableView.isHidden = false
        }
    }
}

// MARK: - EmbedViews

private extension FavoritesView {
    func embedViews() {
        let subviews = [restaurantsTableView, emptyRestaurantsLabel]
        
        subviews.disableAutoresizingMask()
        
        view.addSubviews(
            restaurantsTableView,
            emptyRestaurantsLabel
        )
    }
}

// MARK: - SetupLayout

private extension FavoritesView {
    func setupLayout() {
        NSLayoutConstraint.activate([
            restaurantsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            restaurantsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyRestaurantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emptyRestaurantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emptyRestaurantsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - SetupBehaviour

private extension FavoritesView {
    func setupBehaviour() {
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate

extension FavoritesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        136
    }
}

// MARK: - UITableViewDataSource

extension FavoritesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteRestaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellIdentifiers.cellIdentifier,
            for: indexPath
        ) as? RestaurantCell else {
            return UITableViewCell()
        }
        
        cell.updateValue(favoriteRestaurants[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - RegisterCell

private extension FavoritesView {
    func registerCell() {
        restaurantsTableView.register(RestaurantCell.self, forCellReuseIdentifier: CellIdentifiers.cellIdentifier)
    }
}

// MARK: - SetupAppearance

private extension FavoritesView {
    func setupAppearance() {
        title = "Saved"
        view.backgroundColor = .white
        
        emptyRestaurantsLabel.textAlignment = .center
        emptyRestaurantsLabel.font = UIFont.interMedium(fontSize: 16)
        emptyRestaurantsLabel.numberOfLines = 0
        emptyRestaurantsLabel.textColor = .lightGray
        
        restaurantsTableView.separatorStyle = .none
        
        restaurantsTableView.backgroundColor = .clear
    }
}

// MARK: - SavedViewState

enum SavedViewState {
    case empty
    case nonEmpty
}
