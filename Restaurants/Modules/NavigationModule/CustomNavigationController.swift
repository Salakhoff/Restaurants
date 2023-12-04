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
        navigationBar.overrideUserInterfaceStyle = .light
        
        let textAttributes = [
            NSAttributedString.Key.font: UIFont.poppinsMedium(fontSize: 30)!,
            NSAttributedString.Key.foregroundColor: UIColor.tintColor
        ]
        
        navigationBar.titleTextAttributes = textAttributes
    }
}
