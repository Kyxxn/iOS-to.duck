//
//  TDSnackbar.swift
//  toduck
//
//  Created by 신효성 on 9/19/24.
//
import UIKit


final class TDToast: BaseView {
    let toastView: TDToastView
    
    init(foregroundColor: UIColor, titleText: String, contentText: String) {
        toastView = TDToastView(foregroundColor: foregroundColor, titleText: titleText, contentText: contentText)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }
    
    override func addview() {
        addSubview(toastView)
    }
    
    override func layout() {
        toastView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


// REFACTOR: 변수 이름들 생각
final class TDToastView: BaseView {
    private let foregroundColor: UIColor
    private let titleText: String
    private let contentText: String

    private let sideDumpView: UIView = .init()

    private let stackY = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 2
    }

    private let tomato: TDTomato

    private let sideColor: UIView = .init()

    private let title = TDLabel(toduckFont: .boldBody2)
    private let content = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral800)

    public init(frame: CGRect = .zero, foregroundColor: UIColor, titleText: String, contentText: String) {
        self.foregroundColor = foregroundColor
        self.titleText = titleText
        self.contentText = contentText
        tomato = TDTomato(fruitColor: foregroundColor, size: .medium)
        super.init(frame: frame)
    }

    override func layout() {
        snp.updateConstraints {
            $0.height.equalTo(69)
            $0.width.lessThanOrEqualTo(UIScreen.main.bounds.width - 40) // 최대 너비 제한
        }
        sideDumpView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(8)
        }

        tomato.snp.makeConstraints {
            $0.leading.equalTo(sideDumpView.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }

        stackY.snp.makeConstraints {
            $0.leading.equalTo(tomato.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }

    override func configure() {
        layer.cornerRadius = 8
        backgroundColor = TDColor.Primary.primary25
        clipsToBounds = true
        
        sideDumpView.backgroundColor = foregroundColor
        // sideDumpView.layer.cornerRadius = 8
        // sideDumpView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        title.setColor(foregroundColor)
        title.setText(titleText)

        content.setText(contentText)

        sideColor.backgroundColor = foregroundColor
    }

    override func addview() {
        addSubview(sideDumpView)
        addSubview(tomato)
        addSubview(stackY)

        stackY.addArrangedSubview(title)
        stackY.addArrangedSubview(content)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
