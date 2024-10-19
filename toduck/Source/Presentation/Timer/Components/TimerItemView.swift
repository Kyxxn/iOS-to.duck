//
//  CountItme.swift
//  toduck
//
//  Created by 신효성 on 9/20/24.
//
import UIKit

final class TimerItemView: BaseView {
    //TODO: 이름 파일이름 다시 생각
    private(set) var totalCount: Int
    private(set) var currentCount: Int {
        didSet {
            for i in 0..<totalCount {
                (stack.arrangedSubviews[i] as! TDTomato).hasTerm = (i < currentCount)
            }
        }
    }
    
    private let stack: UIStackView

    init(totalCount: Int = 4, currentCount: Int = 0) {
        self.totalCount = totalCount
        self.currentCount = currentCount
        
        stack = UIStackView(arrangedSubviews: (0..<totalCount).map { _ in
            TDTomato(fruitColor: TDColor.Primary.primary500, size: .small, hasTerm: false)
        }).then { 
            $0.spacing = 8
        }
    
        super.init(frame: .zero)
    }

    override func configure() {
        self.backgroundColor = .clear
    }

    override func layout() {
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.width.equalTo(16 * totalCount + 8 * (totalCount - 1))
            $0.height.equalTo(16)
            $0.center.equalToSuperview()
        }
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setCount(count: Int) {
        totalCount = count
    }

    func setCurrentCount(_ count: Int) {
        currentCount = count
    }
}
