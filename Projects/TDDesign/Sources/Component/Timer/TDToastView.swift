//
//  TDToastView.swift
//  TDDesign
//
//  Created by 박효준 on 10/20/24.
//

import UIKit

// REFACTOR: 변수 이름들 생각
public final class TDToastView: UIView {
    // MARK: - Properties
    private let foregroundColor: UIColor
    private let titleText: String
    private let contentText: String
    private let sideDumpView: UIView = .init()
    private let tomato: TDTomatoIconView
    private let sideColor: UIView = .init()
    private let title = TDLabel(toduckFont: .boldBody2)
    private let content = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral800)
    private let stackY = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 2
    }
    
    // MARK: - Initialize
    public init(frame: CGRect = .zero, foregroundColor: UIColor, titleText: String, contentText: String) {
        self.foregroundColor = foregroundColor
        self.titleText = titleText
        self.contentText = contentText
        tomato = TDTomatoIconView(fruitColor: foregroundColor, size: .medium)
        super.init(frame: frame)
        configure()
        addSubView()
        layout()
    }
    
    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func layout() {
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
    
    private func configure() {
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
    
    private func addSubView() {
        addSubview(sideDumpView)
        addSubview(tomato)
        addSubview(stackY)
        
        stackY.addArrangedSubview(title)
        stackY.addArrangedSubview(content)
    }
}
