//
//  TDLabel.swift
//  toduck
//
//  Created by 박효준 on 7/9/24.
//

import UIKit

final class TDLabel: UILabel {
    private var toduckFont: TDFont
    private let alignment: NSTextAlignment
    private var toduckColor: UIColor
    private var labelText: String
    
    // MARK: - Initialize
    
    init(
        frame: CGRect = .zero,
        labelText: String = "",
        toduckFont: TDFont,
        alignment: NSTextAlignment = .justified,
        toduckColor: UIColor = TDColor.Neutral.neutral800
    ) {
        self.labelText = labelText
        self.toduckFont = toduckFont
        self.alignment = alignment
        self.toduckColor = toduckColor
        
        super.init(frame: frame)
        setupAttributes()
    }
    
    required init?(coder: NSCoder) {
        self.labelText = ""
        self.toduckFont = TDFont.mediumHeader5
        self.alignment = .justified
        self.toduckColor = TDColor.Neutral.neutral800
        
        super.init(coder: coder)
        setupAttributes()
    }
    
    // MARK: - SetUp
    
    private func setupAttributes() {
        let attributedString = NSMutableAttributedString(string: labelText)
        let range = NSRange(location: 0, length: attributedString.length)
        // Attribute 지정할 텍스트 범위
        
        attributedString.addAttribute(
            .font,
            value: toduckFont.font,
            range: range
        )
        
        attributedString.addAttribute(
            .foregroundColor,
            value: toduckColor,
            range: range
        )
        
        attributedString.addAttribute(
            .kern,
            value: toduckFont.letterSpacing,
            range: range
        )
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = toduckFont.lineHeightMultiple
        paragraphStyle.alignment = alignment
        
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: range
        )
        
        attributedText = attributedString
        textColor = toduckColor
    }
    
    func setFont(_ font: TDFont) {
        self.toduckFont = font
        setupAttributes()
    }
    
    func setColor(_ color: UIColor) {
        self.toduckColor = color
        setupAttributes()
    }
    
    func setText(_ text: String) {
        self.labelText = text
        setupAttributes()
    }
}
