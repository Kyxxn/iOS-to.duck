
import SnapKit
import UIKit

public class TDBaseButton: UIButton {
    var title: String
    var foregroundToduckColor: UIColor
    var backgroundToduckColor: UIColor
    var image: UIImage?
    var radius: CGFloat
    var font: UIFont
    var inset: NSDirectionalEdgeInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)

    public init(frame: CGRect = .zero,
                title: String = "",
                image: UIImage? = nil,
                backgroundColor: UIColor = TDColor.Primary.primary500,
                foregroundColor: UIColor = .white,
                radius: CGFloat = 12,
                font: UIFont = TDFont.boldHeader3.font)
    {
        self.title = title
        self.image = image
        self.radius = radius
        self.font = font
        backgroundToduckColor = backgroundColor
        foregroundToduckColor = foregroundColor
        super.init(frame: frame)
        // configurationUpdateHandler = buttonHandler
        setupButton()
        layout()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupButton() {
        backgroundColor = backgroundToduckColor

        setTitleColor(foregroundToduckColor, for: .normal)
        setTitleColor(TDColor.Neutral.neutral500, for: .disabled)
        titleLabel?.font = font

        if let image = image {
            setImage(image, for: .normal)
            imageView?.contentMode = .scaleAspectFit
            imageView?.tintColor = foregroundToduckColor
            if title != "" {
                setTitle(title, for: .normal)
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            }
            else {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: (bounds.width) / 2, bottom: 0, right: 0)
            }
        } else if title != "" {
            setTitle(title, for: .normal)
        }

        layer.cornerRadius = radius
        directionalLayoutMargins = inset
    }

    override public var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = backgroundToduckColor
                setTitleColor(foregroundToduckColor, for: .normal)
                layer.borderWidth = 1

            } else {
                backgroundColor = TDColor.Neutral.neutral300
                setTitleColor(TDColor.Neutral.neutral500, for: .normal)
                layer.borderWidth = 0
            }
        }
    }

    func layout() {
        // snp.updateConstraints {
        //     $0.height.equalTo(56)
        // }
    }

    // MARK: - Radius

    func setRadius(radius: CGFloat) {
        self.radius = radius
        setupButton()
    }

    // MARK: - Font

    func setFont(font: UIFont) {
        self.font = font
        setupButton()
    }

    func setFont(toduckFont: TDFont) {
        setFont(font: toduckFont.font)
    }

    // MARK: - Inset

    func setInset(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        inset = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
        setupButton()
    }

    func setInset(x: CGFloat = 0, y: CGFloat = 0) {
        setInset(top: y, leading: x, bottom: y, trailing: x)
    }

    func setInset(edges: CGFloat) {
        setInset(top: edges, leading: edges, bottom: edges, trailing: edges)
    }

    // MARK: - Shadow

    func setShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
