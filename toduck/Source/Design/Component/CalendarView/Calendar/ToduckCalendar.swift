//
//  TDCalendar.swift
//  toduck
//
//  Created by 박효준 on 8/11/24.
//

import UIKit
import SnapKit
import Then
import FSCalendar

final class ToduckCalendar: BaseCalendar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTDCalendar()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTDCalendar()
    }
    
    private func setupTDCalendar() {
        self.register(SheetCalendarSelectDateCell.self, forCellReuseIdentifier: SheetCalendarSelectDateCell.identifier)
        self.appearance.selectionColor = TDColor.Primary.primary100
        self.appearance.titleSelectionColor = .black
        self.appearance.todayColor = TDColor.Primary.primary500
    }
}
