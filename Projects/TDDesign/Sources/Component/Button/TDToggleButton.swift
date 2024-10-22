import SnapKit
import UIKit

// MARK: - Require Rename

public final class TDToggleButton: TDBaseButton {
    public init(frame: CGRect = .zero, title: String) {
        super.init(frame: frame,
                   title: title,
                   backgroundColor: TDColor.Primary.primary50,
                   foregroundColor: TDColor.Primary.primary500)
        setFont(toduckFont: .mediumBody1)

        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func setupButton() {
        super.setupButton()

        backgroundColor = TDColor.Neutral.neutral50
        setTitleColor(TDColor.Neutral.neutral600, for: .normal)
        layer.borderColor = TDColor.Primary.primary500.cgColor
        layer.borderWidth = 0
    }

    public override func layout() {
        snp.updateConstraints {
            $0.height.equalTo(56)
        }
    }

    // MARK: - 초기 상태 설정 필요

    override public var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = backgroundToduckColor
                setTitleColor(foregroundToduckColor, for: .normal)
                layer.borderWidth = 1
            } else {
                backgroundColor = TDColor.Neutral.neutral50
                setTitleColor(TDColor.Neutral.neutral600, for: .normal)
                layer.borderWidth = 0
            }
        }
    }

    @objc
    func buttonTapped() {
        isSelected.toggle()
    }
}
