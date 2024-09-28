import UIKit

enum TDChipType {
    case capsule
    case roundedRectangle
    
    var activeColor: UIColor {
        switch self {
        case .capsule:
            return TDColor.Neutral.neutral800
        case .roundedRectangle:
            return TDColor.Neutral.neutral700
        }
    }
    
    var inactiveColor: UIColor {
        switch self {
        case .capsule:
            return TDColor.Neutral.neutral200
        case .roundedRectangle:
            return TDColor.Neutral.neutral100
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .capsule:
            return 14
        case .roundedRectangle:
            return 8
        }
    }
    
    var height: CGFloat {
        switch self {
        case .capsule:
            return 28
        case .roundedRectangle:
            return 33
        }
    }
}
