import Foundation
import SnapKit
import UIKit

public enum TDButtonSize {
    case small // 40
    case mediumSmall // 48
    case medium // 52
    case large // 56

    var height: CGFloat {
        switch self {
        case .small:
            return 32
        case .mediumSmall:
            return 48
        case .medium:
            return 52
        case .large:
            return 56
        }
    }

    var radius: CGFloat {
        switch self {
        case .small:
            return 8
        case .mediumSmall,
             .medium,
             .large:
            return 12
        }
    }

    var font: UIFont {
        switch self {
        case .small:
            return TDFont.boldBody2.font
        case .mediumSmall,
             .medium,
             .large:
            return TDFont.boldHeader3.font
        }
    }
}

public final class TDButton: TDBaseButton {
    var size: TDButtonSize!

    public init(frame: CGRect = .zero,
                title: String,
                size: TDButtonSize = .medium,
                foregroundColor: UIColor = .white,
                backgroundColor: UIColor = TDColor.Primary.primary500)
    {
        self.size = size

        super.init(frame: frame,
                   title: title,
                   backgroundColor: backgroundColor,
                   foregroundColor: foregroundColor,
                   radius: size.radius,
                   font: size.font)
    }


    public override func layout() {
        snp.updateConstraints {
            $0.height.equalTo(size.height)
        }
    }
}
