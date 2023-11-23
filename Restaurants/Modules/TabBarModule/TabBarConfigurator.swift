import UIKit

final class TabBarConfigurator {
    
    func configure() -> UITabBarController {
        return tabBarController
    }
}

private extension TabBarConfigurator {
    
    // MARK: - Tab Bar Controller
    var tabBarController: UITabBarController {
        let controller = UITabBarController()
        controller.tabBar.tintColor = .tintColor
        controller.tabBar.unselectedItemTintColor = .lightGray
        controller.tabBar.backgroundColor = .white
        controller.viewControllers = viewControllers
        
        if let items = controller.tabBar.items {
            for item in items {
                let attributes: [NSAttributedString.Key: Any] = [
                    NSAttributedString.Key.font: UIFont.robotoMedium(fontSize: 12) ?? .systemFont(ofSize: 12),
                ]
                item.setTitleTextAttributes(attributes, for: .normal)
            }
        }
        
        return controller
    }
    
    // MARK: - View Controllers
    var viewControllers: [UIViewController] {
        var viewControllers = [UIViewController]()
        
        Tabs.allCases.forEach { tab in
            let controller = makeViewController(of: tab)
            let navigationView = CustomNavigationController(rootViewController: controller)
            let tabBarItem = UITabBarItem(
                title: tab.property.title,
                image: tab.property.image,
                selectedImage: tab.property.image
            )
            controller.tabBarItem = tabBarItem
            viewControllers.append(navigationView)
        }
        
        return viewControllers
    }
    
    // MARK: - Helper Methods
    func makeViewController(of tab: Tabs) -> UIViewController {
        switch tab {
        case .search:
            return SearchViewAssembly.build()
        case .saved:
            // TODO: Тут установить SavedModule
            return UIViewController()
        case .settings:
            return SettingsAssembly.build()
        }
    }
}
