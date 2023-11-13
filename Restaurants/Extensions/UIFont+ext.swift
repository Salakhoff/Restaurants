
import UIKit

extension UIFont {
    
    static func interRegular12() -> UIFont? {
        return UIFont.init(name: "Inter-Regular", size: 12)
    }
    
    static func interSemiBold24() -> UIFont? {
        return UIFont.init(name: "Inter-SemiBold", size: 24)
    }
    
    static func poppinsSemiBold20() -> UIFont? {
        return UIFont.init(name: "Poppins-SemiBold", size: 20)
    }
    
    static func poppinsSemiBold(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "Poppins-SemiBold", size: size)
    }
    
    static func robotoMedium(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: size)
    }
}
