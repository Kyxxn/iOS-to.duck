//
//  TDTomato.swift
//  toduck
//
//  Created by 신효성 on 9/24/24.
//

import UIKit

final class TDTomatoIconView: UIView {
    // MARK: - Properties
    private let tomatoTerm = TDImage.tomatoTerm
    private let termImageView: UIImageView 
    private let tomatoSize: TDTomatoSize
    private var fruitColor: UIColor
    
    // MARK: - Initialize
    init(fruitColor: UIColor,size: TDTomatoSize, hasTerm: Bool = true) {
        self.fruitColor = fruitColor
        self.tomatoSize = size
        self.hasTerm = hasTerm
        termImageView = UIImageView(image: tomatoTerm)
        super.init(frame: .zero)
        setup()
        layout()
        termSetup()

        self.hasTerm = hasTerm
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    func setup() {
        layer.cornerRadius = CGFloat(tomatoSize.size / 2)
        backgroundColor = fruitColor
    }

    func layout() {
        snp.makeConstraints {
            $0.width.height.equalTo(tomatoSize.size)
        }
    }

    func termSetup() {
        termImageView.frame = tomatoSize.termSize
        termImageView.center = tomatoSize.termPosition

        addSubview(termImageView)
    }

    func setColor(color: UIColor) {
        fruitColor = color
        backgroundColor = fruitColor
    }
    
    //TODO: 이름 다시 생각
    var hasTerm: Bool {
        didSet {
            if hasTerm {
                termImageView.image = TDImage.tomatoTerm
                backgroundColor = fruitColor
            } else {
                termImageView.image = nil
                backgroundColor = TDColor.Primary.primary25
            }
        }
    }
}

enum TDTomatoSize {
        case small
        case medium

        var size: Int {
            switch self {
            case .small:
                return 16
            case .medium:
                return 22
            }
        }
        
        var termSize: CGRect {
            switch self {
            case .small:
                return CGRect(x: 0, y: 0, width: 9, height: 5.14)
            case .medium:
                return CGRect(x: 0, y: 0, width: 12.38, height: 6.86)
            }
        }

        var termPosition: CGPoint {
            switch self {
            case .small: 
                return CGPoint(x: 10, y: 0.8)
            case .medium:
                return CGPoint(x: 13, y: 1)
            }
        }
    }
