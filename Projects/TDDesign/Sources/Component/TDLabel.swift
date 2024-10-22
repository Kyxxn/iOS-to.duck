//
//  TDLabel.swift
//  toduck
//
//  Created by 박효준 on 7/9/24.
//

import UIKit

public final class TDLabel: UILabel {
    private var toduckFont: TDFont
    private let alignment: NSTextAlignment
    private var toduckColor: UIColor
    private var labelText: String
    
    // MARK: - Initialize
    
    ///  커스텀 Label:  텍스트, 폰트, 정렬, 색상 지정이 가능합니다.
    ///
    /// - Parameters:
    ///   - frame: 레이블의 프레임. 기본값은 `.zero`입니다.
    ///   - labelText: 레이블에 표시될 텍스트. 기본값은 빈 문자열입니다.
    ///   - toduckFont: `TDFont` 클래스에서 정의된 커스텀 폰트입니다.
    ///   - alignment: 텍스트 정렬 방식. 기본값은 `.justified`입니다.
    ///   - toduckColor: 텍스트 색상. 기본값은 `TDColor.Neutral.neutral800`입니다.
    
    public init(
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
    
    public required init?(coder: NSCoder) {
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
    
    public func setFont(_ font: TDFont) {
        self.toduckFont = font
        setupAttributes()
    }
    
    public func setColor(_ color: UIColor) {
        self.toduckColor = color
        setupAttributes()
    }
    
    public func setText(_ text: String) {
        self.labelText = text
        setupAttributes()
    }
}
