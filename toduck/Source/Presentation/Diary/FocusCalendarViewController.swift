//
//  FocusCalendarViewController.swift
//  toduck
//
//  Created by 박효준 on 9/8/24.
//

import FSCalendar
import SnapKit
import Then
import UIKit


class FocusCalendarViewController: BaseViewController<BaseView>, TDCalendarConfigurable {
    var calendarHeader = CalendarHeaderStackView(type: .diary)
    var calendar = DiaryCalendar()
    let dummyFocusDates = [
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 1)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 2)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 3)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 4)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 5)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 6)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 7)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 8)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 9)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 10)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 11)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 12)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 13)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 14)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 15)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 16)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 17)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 18)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 19)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 20)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 21)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 22)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 23)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 24)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 25)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 26)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 27)),
        Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 28))
    ].compactMap { $0 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCalendar()
        calendarHeader.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
        }
        
        calendar.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(calendarHeader.snp.top).offset(100)
            $0.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.9)
            $0.height.equalTo(400)
        }
    }
}

// MARK: - DataSource

extension FocusCalendarViewController {
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        guard let cell = calendar.dequeueReusableCell(withIdentifier: DiaryCalendarSelectDateCell.identifier, for: date, at: position) as? DiaryCalendarSelectDateCell else { return FSCalendarCell() }
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)

        if dummyFocusDates.contains(date) {
            switch day {
            case 1:
                cell.backImageView.image = TDImage.Percent.Dot.percent0
            case 2:
                cell.backImageView.image = TDImage.Percent.Dot.percent10
            case 3:
                cell.backImageView.image = TDImage.Percent.Dot.percent20
            case 4:
                cell.backImageView.image = TDImage.Percent.Dot.percent30
            case 5:
                cell.backImageView.image = TDImage.Percent.Dot.percent40
            case 6:
                cell.backImageView.image = TDImage.Percent.Dot.percent50
            case 7:
                cell.backImageView.image = TDImage.Percent.Dot.percent60
            case 8:
                cell.backImageView.image = TDImage.Percent.Dot.percent70
            case 9:
                cell.backImageView.image = TDImage.Percent.Dot.percent80
            case 10:
                cell.backImageView.image = TDImage.Percent.Dot.percent90
            case 11:
                cell.backImageView.image = TDImage.Percent.Dot.percent100
            case 12:
                cell.backImageView.image = TDImage.Percent.percent0
            case 13:
                cell.backImageView.image = TDImage.Percent.percent10
            case 14:
                cell.backImageView.image = TDImage.Percent.percent20
            case 15:
                cell.backImageView.image = TDImage.Percent.percent30
            case 16:
                cell.backImageView.image = TDImage.Percent.percent40
            case 17:
                cell.backImageView.image = TDImage.Percent.percent50
            case 18:
                cell.backImageView.image = TDImage.Percent.percent60
            case 19:
                cell.backImageView.image = TDImage.Percent.percent70
            case 20:
                cell.backImageView.image = TDImage.Percent.percent80
            case 21:
                cell.backImageView.image = TDImage.Percent.percent90
            case 22:
                cell.backImageView.image = TDImage.Percent.percent100
            case 23:
                cell.backImageView.image = TDImage.Mood.angry
                cell.titleLabel = nil
            case 24:
                cell.backImageView.image = TDImage.Mood.anxiety
                cell.titleLabel = nil
            case 25:
                cell.backImageView.image = TDImage.Mood.calmness
                cell.titleLabel = nil
            case 26:
                cell.backImageView.image = TDImage.Mood.happy
                cell.titleLabel = nil
            case 27:
                cell.backImageView.image = TDImage.Mood.sad
                cell.titleLabel = nil
            case 28:
                cell.backImageView.image = TDImage.Mood.tired
                cell.titleLabel = nil
            default:
                cell.backImageView.image = nil
            }
        }
        
        return cell
    }
}
