//
//  FocusCalendar.swift
//  toduck
//
//  Created by 박효준 on 9/8/24.
//

import FSCalendar
import SnapKit
import Then
import UIKit

final class FocusCalendar: BaseCalendar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFocusCalendar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFocusCalendar()
    }
    
    private func setupFocusCalendar() {
        self.register(FocusCalendarSelectDateCell.self, forCellReuseIdentifier: FocusCalendarSelectDateCell.identifier)
        self.appearance.selectionColor = .clear
    }
}
