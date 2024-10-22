import SnapKit
import UIKit

public final class TDRadioButton: UIButton {
    private let outerCircleLayer = CAShapeLayer()
    private let innerCircleLayer = CAShapeLayer()

    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupRadioButton()
        layout()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupRadioButton() {
        // Outer circle
        outerCircleLayer.fillColor = UIColor.clear.cgColor
        outerCircleLayer.strokeColor = TDColor.Primary.primary500.cgColor
        outerCircleLayer.lineWidth = 1
        layer.addSublayer(outerCircleLayer)

        // Inner circle
        innerCircleLayer.fillColor = TDColor.Primary.primary500.cgColor
        innerCircleLayer.strokeColor = UIColor.clear.cgColor
        layer.addSublayer(innerCircleLayer)

        // 버튼 클릭 이벤트 연결
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        let outerCirclePath = UIBezierPath(ovalIn: bounds)
        outerCircleLayer.path = outerCirclePath.cgPath

        let insetBounds = bounds.insetBy(dx: 5, dy: 5)
        let innerCirclePath = UIBezierPath(ovalIn: insetBounds)
        innerCircleLayer.path = innerCirclePath.cgPath
    }

    @objc private func buttonTapped() {
        isSelected.toggle()
    }

    override public var isSelected: Bool {
        didSet {
            innerCircleLayer.isHidden = !isSelected
            updateCircleColors()
        }
    }

    override public var isEnabled: Bool {
        didSet {
            updateCircleColors()
        }
    }

    private func updateCircleColors() {
        if isEnabled {
            outerCircleLayer.strokeColor = isSelected ? TDColor.Primary.primary500.cgColor : TDColor.Neutral.neutral700.cgColor
            innerCircleLayer.fillColor = isSelected ? TDColor.Primary.primary500.cgColor : UIColor.clear.cgColor
        } else {
            outerCircleLayer.strokeColor = TDColor.Neutral.neutral300.cgColor
            innerCircleLayer.fillColor = isSelected ? TDColor.Neutral.neutral300.cgColor : UIColor.clear.cgColor
        }
    }

    private func layout() {
        snp.makeConstraints {
            $0.width.height.equalTo(20)
        }
    }
}
