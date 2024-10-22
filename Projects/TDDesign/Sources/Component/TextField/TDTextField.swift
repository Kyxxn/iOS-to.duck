import SnapKit
import UIKit

public final class TDTextField: UIView {
    private var textField: TDTextFieldCore
    private var placeholder: String
    private var labelText: String

    private var errorStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .leading
    }

    private var topLabel: TDLabel?

    public var error: String {
        didSet {
            textField.error = hasError
            if hasError {
                if let errorLabel = errorStack.arrangedSubviews.first(where: { $0 is TDLabel }) as? TDLabel {
                    errorStack.removeArrangedSubview(errorLabel)
                    errorLabel.removeFromSuperview()
                }
                let errorLabel = TDLabel(labelText: error, toduckFont: .mediumBody2, toduckColor: TDColor.Semantic.error)
                errorStack.addArrangedSubview(errorLabel)
                topLabel?.setColor(TDColor.Semantic.error)
            } else {
                if let errorLabel = errorStack.arrangedSubviews.first(where: { $0 is TDLabel }) as? TDLabel {
                    errorStack.removeArrangedSubview(errorLabel)
                    errorLabel.removeFromSuperview()
                }
                topLabel?.setColor(TDColor.Neutral.neutral800) // 기본 색상으로 변경
            }
            updateLayout() // 레이아웃 업데이트
        }
    }

    private var hasError: Bool {
        return !(error == "")
    }

    private var existLabel: Bool {
        return !(labelText == "")
    }

    init(frame: CGRect = .zero, placeholder: String = "", labelText: String = "") {
        self.placeholder = placeholder
        self.labelText = labelText
        error = ""
        textField = TDTextFieldCore(placeholder: placeholder)
        super.init(frame: frame)

        setupViews()
        updateLayout()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.alignment = .leading
        addSubview(mainStack)

        if existLabel {
            let label = TDLabel(labelText: labelText, toduckFont: .mediumHeader5)
            topLabel = label
            mainStack.addArrangedSubview(label)
        }

        mainStack.addArrangedSubview(textField)
        mainStack.addArrangedSubview(errorStack)

        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        textField.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }

    private func updateLayout() {
        if hasError {
            errorStack.isHidden = false
        } else {
            errorStack.isHidden = true
        }

        layoutIfNeeded()
    }

    private var labelStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .leading
    }

    func layout() {
        textField.snp.makeConstraints {
            $0.width.equalToSuperview()
        }

        if hasError {
            errorStack.snp.updateConstraints {
                $0.width.equalToSuperview()
            }
            snp.updateConstraints {
                $0.height.equalTo(80)
            }
        } else {
            snp.updateConstraints {
                $0.height.equalTo(56)
            }
        }
    }
}



fileprivate final class TDTextFieldCore: UITextField, UITextFieldDelegate {
    public var error: Bool {
        didSet {
            layer.borderColor = error ? TDColor.Semantic.error.cgColor : TDColor.Neutral.neutral300.cgColor
        }
    }

    public convenience init(frame: CGRect = .zero, placeholder: String = "") {
        self.init(frame: frame)
        delegate = self

        self.placeholder = placeholder
        setupTextField()
        layout()
    }

    override init(frame: CGRect) {
        error = false
        super.init(frame: frame)
        placeholder = ""
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextField() {
        borderStyle = .none
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = TDColor.Neutral.neutral300.cgColor
        backgroundColor = TDColor.Neutral.neutral50
        font = TDFont.mediumBody2.font
        clearButtonMode = .whileEditing

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: frame.height))
        leftView = paddingView
        leftViewMode = .always

        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: TDColor.Neutral.neutral500])
    }

    private func layout() {
        snp.updateConstraints {
            $0.height.equalTo(56)
        }
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 48))
    }

    override public func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let buttonWidth: CGFloat = 24
        let buttonHeight: CGFloat = 24
        let xPosition = bounds.width - buttonWidth - 16
        let yPosition = (bounds.height - buttonHeight) / 2
        return CGRect(x: xPosition, y: yPosition, width: buttonWidth, height: buttonHeight)
    }

    public func textFieldDidBeginEditing(_: UITextField) {
        layer.borderColor = error ? TDColor.Semantic.error.cgColor : TDColor.Neutral.neutral800.cgColor
    }

    public func textFieldDidEndEditing(_: UITextField) {
        layer.borderColor = error ? TDColor.Semantic.error.cgColor : TDColor.Neutral.neutral300.cgColor
    }
}
