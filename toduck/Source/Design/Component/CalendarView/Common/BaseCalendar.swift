//
//  BaseCalendar.swift
//  toduck
//
//  Created by 박효준 on 8/16/24.
//

import FSCalendar
import SnapKit
import Then
import UIKit

class BaseCalendar: FSCalendar, FSCalendarDataSource, FSCalendarDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
        setupCalendar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHeader()
        setupCalendar()
    }
    
    private func setupCalendar() {
        self.placeholderType = .none  // 인접한 달 첫주,마지막주 제거
        self.today = nil // 오늘 선택 해제
        self.backgroundColor = .white
        self.locale = Locale(identifier: "ko_KR")
        self.scrollDirection = .horizontal
        self.scope = .month
        
        self.appearance.headerMinimumDissolvedAlpha = 0.0 // 인접한 달 헤더 제거
        self.appearance.selectionColor = TDColor.Primary.primary100
        self.appearance.weekdayTextColor = TDColor.Neutral.neutral600
    }
    
    // HeaderStackView는 각각의 Calendar에서 커스텀하게 해뒀습니다 (stackView 내용이 다 다름)
    private func setupHeader() {
        self.calendarHeaderView.isHidden = true
        self.headerHeight = 0
    }
}


