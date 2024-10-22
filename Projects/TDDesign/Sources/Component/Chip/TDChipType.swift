import UIKit

public enum TDChipType {
    case capsule
    case roundedRectangle
    
    public var activeColor: UIColor {
        switch self {
        case .capsule:
            return TDColor.Neutral.neutral800
        case .roundedRectangle:
            return TDColor.Neutral.neutral700
        }
    }
    
    public var inactiveColor: UIColor {
        switch self {
        case .capsule:
            return TDColor.Neutral.neutral200
        case .roundedRectangle:
            return TDColor.Neutral.neutral100
        }
    }
    
    public var cornerRadius: CGFloat {
        switch self {
        case .capsule:
            return 14
        case .roundedRectangle:
            return 8
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .capsule:
            return 28
        case .roundedRectangle:
            return 33
        }
    }
}
