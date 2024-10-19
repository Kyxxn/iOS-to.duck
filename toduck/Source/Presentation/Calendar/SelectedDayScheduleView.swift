//
//  SelectedDayScheduleView.swift
//  toduck
//
//  Created by 박효준 on 9/29/24.
//

import FSCalendar
import SnapKit
import Then
import UIKit

final class SelectedDayScheduleView: BaseView {
    private let headerView = UIView().then {
        $0.backgroundColor = TDColor.Neutral.neutral50
    }
    private let calendarImageView = UIImageView().then {
        $0.image = TDImage.Calendar.top3Medium
        $0.contentMode = .scaleAspectFill
    }
    private let dateLabel = UILabel().then {
        $0.text = "9월 29일 (일)"
        $0.font = TDFont.boldHeader5.font
        $0.textColor = TDColor.Neutral.neutral700
    }
    private let downDirectionImageView = UIImageView().then {
        $0.image = TDImage.Direction.downMedium
    }
    
    private let scheduleTableView = UITableView().then {
        $0.backgroundColor = .blue
        $0.separatorStyle = .none
    }
    
    init() {
        super.init(frame: .zero)
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDateLabel(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 d일 (E)"
        dateLabel.text = dateFormatter.string(from: date)
    }
}

private extension SelectedDayScheduleView {
    func setConstraints() {
        addSubview(headerView)
        addSubview(scheduleTableView)
        [calendarImageView, dateLabel, downDirectionImageView].forEach {
            headerView.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        calendarImageView.snp.makeConstraints {
            $0.leading.equalTo(headerView.snp.leading).offset(21)
            $0.centerY.equalTo(headerView.snp.centerY)
            $0.width.height.equalTo(24)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(calendarImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(headerView.snp.centerY)
        }
        
        downDirectionImageView.snp.makeConstraints {
            $0.trailing.equalTo(headerView.snp.trailing).offset(-21)
            $0.centerY.equalTo(headerView.snp.centerY)
            $0.width.height.equalTo(24)
        }
        
        scheduleTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
