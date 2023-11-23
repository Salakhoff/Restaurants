
import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: Properties
    
    var output: SearchViewOutput?
    
    // MARK: UI
    
    private let topLabel = TopLabelView()
    private let searchField = SearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedViews()
        setupLayout()
        setupAppearance()
        setupBehaviour()
        upKeyboard()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Embed Views

private extension SearchViewController {
    
    func embedViews() {
        let subviews = [topLabel,searchField]

        view.addSubviews(topLabel, searchField)
    
        subviews.disableAutoresizingMask()
    }
}

// MARK: - Setup Layout

private extension SearchViewController {
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Metric.topLabelVertcalOffset),
            topLabel.heightAnchor.constraint(equalToConstant: Constants.Metric.topLabelHeight),
            
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Metric.searchFieldHorizontalOffset),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Metric.searchFieldHorizontalOffset),
            searchField.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -Constants.Metric.searchFieldBottomOffset),
            searchField.heightAnchor.constraint(equalToConstant: Constants.Metric.searchFieldHeight)
        ])
    }
}

// MARK: - Setup Behaviour

private extension SearchViewController {
    
    func setupBehaviour() {
        searchField.searchBarDelegate = self
    }
}

// MARK: - Setup Appearance

private extension SearchViewController {
    
    func setupAppearance() {
        view.backgroundColor = .white
        title = "Welcome!"
        tabBarItem.title = "Search"
    }
}

// MARK: - Search Bar Delegate

extension SearchViewController: SearchBarDelegate {
    
    func startSearching() {
        self.title = nil
    }
    
    func changeSearching(text: String) {
        print(#function)
        output?.didSearch(with: text)
    }
}

// MARK: - Notifiacation Center

extension SearchViewController {
    
    private func upKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

// MARK: - Objc methods

@objc
private extension SearchViewController {
    
    func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = -Constants.Metric.offsetView
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
}

//MARK: - Search View Input

extension SearchViewController: SearchViewInput {}

// MARK: - Constants

private extension SearchViewController {
    
    enum Constants {
        enum Metric {
            static let topLabelVertcalOffset: CGFloat = 60
            static let topLabelHeight: CGFloat = 272
            
            static let searchFieldHorizontalOffset: CGFloat = 15
            static let searchFieldBottomOffset: CGFloat = 55
            static let searchFieldHeight: CGFloat = 60
            
            static let offsetView: CGFloat = 200
        }
    }
}
