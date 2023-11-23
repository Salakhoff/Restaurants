
import UIKit

extension UIStackView {
    
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat
    ) {
        self.init()
        self.axis = axis
        self.spacing = spacing
    }
    
    convenience init(
        axis: NSLayoutConstraint.Axis,
        distribution:UIStackView.Distribution,
        alignment: UIStackView.Alignment,
        spacing: CGFloat
    ) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.backgroundColor = .clear
    }
}
