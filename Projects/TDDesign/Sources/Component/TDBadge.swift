import UIKit

public final class TDBadge: UIView {
    // 색깔 정해지면 나중에 Extension으로 빼기,

    private var title: String
    private var backgroundToduckColor: UIColor
    private var foregroundToduckColor: UIColor
    private var cornerRadius: CGFloat
    private var font: TDFont
    private var label: TDLabel

    public init(frame: CGRect = .zero,
                title: String,
                font: TDFont,
                backgroundToduckColor: UIColor,
                foregroundToduckColor: UIColor,
                cornerRadius: CGFloat)
    {
        self.title = title
        self.font = font
        self.backgroundToduckColor = backgroundToduckColor
        self.foregroundToduckColor = foregroundToduckColor
        self.cornerRadius = cornerRadius
        label = TDLabel(labelText: title, toduckFont: self.font, toduckColor: self.foregroundToduckColor)
        super.init(frame: .zero)

        setupBadge()
        layout()
    }

    public convenience init(badgeTitle: String) {
        self.init(badgeTitle: badgeTitle, backgroundColor: TDColor.Primary.primary25, foregroundColor: TDColor.Primary.primary200)
    }

    public convenience init(badgeTitle: String, backgroundColor: UIColor, foregroundColor: UIColor) {
        self.init(
            title: badgeTitle,
            font: .mediumCaption2,
            backgroundToduckColor: backgroundColor,
            foregroundToduckColor: foregroundColor,
            cornerRadius: 4
        )
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBadge() {
        label.sizeToFit()
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        backgroundColor = backgroundToduckColor
    }

    private func layout() {
        addSubview(label)

        self.snp.makeConstraints {
            $0.height.equalTo(20)
        }

        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.top.equalToSuperview()
        }
    }

    public func setTitle(_ title: String) {
        self.title = title
        label.setText(self.title)
        setupBadge()
    }

    public func setFont(_ font: TDFont) {
        self.font = font
        label.setFont(font)
        setupBadge()
    }

    public func setCornerRadius(_ cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        setupBadge()
    }

    public func setTitleColor(_ titleColor: UIColor) {
        self.foregroundToduckColor = titleColor
        label.setColor(foregroundToduckColor)
        setupBadge()
    }

    public func setBackgroundToduckColor(_ backgroundToduckColor: UIColor) {
        self.backgroundToduckColor = backgroundToduckColor
        backgroundColor = backgroundToduckColor
        setupBadge()
    }
}
