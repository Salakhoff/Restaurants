import UIKit

final class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
}

private extension CustomNavigationController {
    
    func configureNavigationBar() {
        navigationBar.prefersLargeTitles = false
        additionalSafeAreaInsets.top = 30
        
        let textAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 29),
            NSAttributedString.Key.foregroundColor: UIColor.tintColor
        ]
        
        navigationBar.titleTextAttributes = textAttributes
    }
}
