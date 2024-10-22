//
//  CountItme.swift
//  toduck
//
//  Created by 신효성 on 9/20/24.
//
import UIKit

public final class TimerItemView: UIView {
    //TODO: 이름 파일이름 다시 생각
    private let stack: UIStackView
    private(set) var totalCount: Int
    private(set) var currentCount: Int {
        didSet {
            for i in 0..<totalCount {
                (stack.arrangedSubviews[i] as! TDTomatoIconView).hasTerm = (i < currentCount)
            }
        }
    }
    
    public init(totalCount: Int = 4, currentCount: Int = 0) {
        self.totalCount = totalCount
        self.currentCount = currentCount
        
        stack = UIStackView(arrangedSubviews: (0..<totalCount).map { _ in
            TDTomatoIconView(fruitColor: TDColor.Primary.primary500, size: .small, hasTerm: false)
        }).then { 
            $0.spacing = 8
        }
        super.init(frame: .zero)
        configure()
        layout()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.backgroundColor = .clear
    }

    private func layout() {
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.width.equalTo(16 * totalCount + 8 * (totalCount - 1))
            $0.height.equalTo(16)
            $0.center.equalToSuperview()
        }
    }

    public func setCount(count: Int) {
        totalCount = count
    }

    public func setCurrentCount(_ count: Int) {
        currentCount = count
    }
}
