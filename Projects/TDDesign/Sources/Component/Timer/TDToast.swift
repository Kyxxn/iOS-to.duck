//
//  TDSnackbar.swift
//  toduck
//
//  Created by 신효성 on 9/19/24.
//

import UIKit

public final class TDToast: UIView {
    public let toastView: TDToastView
    
    public init(foregroundColor: UIColor, titleText: String, contentText: String) {
        toastView = TDToastView(foregroundColor: foregroundColor, titleText: titleText, contentText: contentText)
        super.init(frame: .zero)
        configure()
        layout()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        addSubview(toastView)
    }
    
    private func layout() {
        toastView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
