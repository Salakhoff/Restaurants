import UIKit

enum Tabs: CaseIterable {
    case search
    case saved
    case settings
    
    var property: TabProperty {
        switch self {
        case .search:
            TabProperty(
                title: "Search",
                image: UIImage(named: "SearchImage"),
                selectedImage: UIImage(named: "SearchImage")
            )
        case .saved:
            TabProperty(
                title: "Saved",
                image: UIImage(named: "SavedImage"),
                selectedImage: UIImage(named: "SavedImage")
            )
        case .settings:
            TabProperty(
                title: "Settings",
                image: UIImage(named: "SettingsImage"),
                selectedImage: UIImage(named: "SettingsImage")
            )
        }
    }
}
