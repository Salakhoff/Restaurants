
import UIKit

protocol SearchBarDelegate: AnyObject {
    
    func startSearching()
    func changeSearching(text: String)
}

final class SearchBar: UISearchTextField {
    
    // MARK: Properties
    
    weak var searchBarDelegate: SearchBarDelegate?
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Search Bar

private extension SearchBar {
    
    private func setupSearchBar() {
        delegate = self
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.masksToBounds = true
        attributedPlaceholder = NSAttributedString(
            string: "Search for Restaurants by Location",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.interMedium(fontSize: 12)!
            ])
        self.autocorrectionType = .no
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 60))
        let searchImage = UIImageView(image: UIImage(named: "SearchIcon"))
        searchImage.frame = CGRect(x: 32, y: 22, width: 16, height: 16)
        searchImage.tintColor = .gray
        containerView.addSubview(searchImage)
        leftView = containerView
        leftViewMode = .always
        returnKeyType = .search
        enablesReturnKeyAutomatically = true
    }
}

// MARK: - Text field delegate

extension SearchBar: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeholder = " Type a city"
        searchBarDelegate?.startSearching()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            searchBarDelegate?.changeSearching(text: text)
        }
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if let currentText = textField.text {
            if currentText.count >= 2 {
                searchBarDelegate?.changeSearching(text: currentText)
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
