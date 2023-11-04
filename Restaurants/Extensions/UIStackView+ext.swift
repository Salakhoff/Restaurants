
import UIKit

extension UIStackView {
    
    convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(
        axis: NSLayoutConstraint.Axis,
        distribution:UIStackView.Distribution,
        alignment: UIStackView.Alignment,
        spacing: CGFloat,
        arrangedSubviews: [UIView]
    ) {
            self.init(arrangedSubviews: arrangedSubviews)
            self.axis = axis
            self.distribution = distribution
            self.alignment = alignment
            self.spacing = spacing
            self.backgroundColor = .clear
        }
}
