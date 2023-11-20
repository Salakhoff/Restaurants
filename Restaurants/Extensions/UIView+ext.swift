
import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    func makeButtonShadow() {
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0.796, green: 0.841, blue: 1, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    func makeCellShadow() {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}
