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
        additionalSafeAreaInsets.top = 29
        
        let textAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont.poppinsMedium(fontSize: 30) ?? UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor: UIColor.tintColor
        ]
        
        navigationBar.titleTextAttributes = textAttributes
    }
}
