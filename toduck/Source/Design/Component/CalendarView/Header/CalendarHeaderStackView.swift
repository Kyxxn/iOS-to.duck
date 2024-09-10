//
//  CalendarHeaderStackView.swift
//  toduck
//
//  Created by 박효준 on 8/17/24.
//

import UIKit
import SnapKit
import Then

final class CalendarHeaderStackView: UIStackView {
    let titleLabel = TDLabel(labelText: "", toduckFont: TDFont.boldHeader4)
    let pickerButton = UIButton(type: .system).then {
        $0.setImage(TDImage.Direction.right2Medium, for: .normal)
    }
    
    init(type: CalendarType) {
        super.init(frame: .zero)
        
        switch type {
        case .toduck, .diary:
            setupDefaultHeader()
        case .sheet:
            setupSheetHeader()
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupDefaultHeader() {
        self.axis = .horizontal
        self.spacing = 8
        
        let title = TDLabel(
            labelText: "2024년 8월",
            toduckFont: TDFont.boldHeader4,
            alignment: .center,
            toduckColor: TDColor.Neutral.neutral800
        )
        let pickerButton = PickerButton(type: .toduck)
        
        addArrangedSubview(title)
        addArrangedSubview(pickerButton)
    }
    
    private func setupSheetHeader() {
        self.axis = .horizontal
        self.spacing = 4
        
        let calendarImage = UIImageView(image: TDImage.Calendar.top3Medium)
        let label = TDLabel(
            labelText: "2024년 8월",
            toduckFont: TDFont.mediumHeader5,
            alignment: .center,
            toduckColor: TDColor.Neutral.neutral600
        )
        let pickerButton = PickerButton(type: .sheet)
        
        addArrangedSubview(calendarImage)
        addArrangedSubview(label)
        addArrangedSubview(pickerButton)
    }
}
