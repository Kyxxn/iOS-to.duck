//
//  TDCalendarConfigurable.swift
//  toduck
//
//  Created by 박효준 on 8/18/24.
//

import FSCalendar
import TDDesign
import UIKit

// MARK: 캘린더 헤더와 몸통을 세팅해주는 프로토콜

protocol TDCalendarConfigurable: FSCalendarDelegateAppearance, FSCalendarDataSource,
                                    FSCalendarDelegate where Self: UIViewController {
    associatedtype CalendarType: BaseCalendar
    
    var calendarHeader: CalendarHeaderStackView { get }
    var calendar: CalendarType { get }
    
    func setupCalendar()
    func updateHeaderLabel(for date: Date)
}

extension TDCalendarConfigurable {
    func setupCalendar() {
        view.addSubview(calendarHeader)
        view.addSubview(calendar)
        calendar.delegate = self
        calendar.dataSource = self
        updateHeaderLabel(for: calendar.currentPage)
    }
    
    func updateHeaderLabel(for date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월"
        
        if let headerLabel = calendarHeader.arrangedSubviews.compactMap({ $0 as? TDLabel }).first {
            headerLabel.setText(dateFormatter.string(from: date))
        }
    }
    
    // 공통된 날짜 색상 로직 처리
    func colorForDate(_ date: Date) -> UIColor? {
        let weekday = Calendar.current.component(.weekday, from: date)
        
        // 오늘 날짜 확인
        if Calendar.current.isDate(date, inSameDayAs: Date()) {
            return TDColor.Primary.primary500
        }
        
        // 요일별 색상 설정
        switch weekday {
        case 1:  // 일요일
            return TDColor.Semantic.error
        case 7:  // 토요일
            return TDColor.Schedule.text6
        default:
            return TDColor.Neutral.neutral800
        }
    }
}
