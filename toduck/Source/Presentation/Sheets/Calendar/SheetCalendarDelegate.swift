//
//  SheetCalendarDelegate.swift
//  toduck
//
//  Created by 박효준 on 9/1/24.
//

import Foundation

protocol SheetCalendarDelegate: AnyObject {
    func didSelectDate(_ date: Date)
    func didDeselectDate(_ date: Date)
}
