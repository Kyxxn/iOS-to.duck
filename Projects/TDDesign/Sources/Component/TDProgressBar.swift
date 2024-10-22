import Foundation
import UIKit

public final class TDProgressBar: UIProgressView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration()
    }

    private func configuration() {
        progressTintColor = TDColor.Primary.primary500
        trackTintColor = TDColor.Neutral.neutral800
        snp.updateConstraints {
            $0.height.equalTo(4)
        }
    }
}
