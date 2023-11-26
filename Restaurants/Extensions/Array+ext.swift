
import UIKit

extension Array {
    
    func disableAutoresizingMask() {
        forEach {
            ($0 as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
