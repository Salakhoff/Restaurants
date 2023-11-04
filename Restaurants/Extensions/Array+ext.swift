
import UIKit

extension Array {
    
    func removeConstraints() {
        self.forEach {
            ($0 as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
