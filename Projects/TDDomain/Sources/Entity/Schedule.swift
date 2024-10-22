//
//  Schedule.swift
//  toduck
//
//  Created by 박효준 on 5/31/24.
//

import Foundation

public enum CategoryImage: String, Hashable {
    case a
}

public enum Weekday: String, Hashable {
    case monday = "월", tuesday = "화", wednesday = "수",
         thursday = "목", friday = "금", saturday = "토", sunday = "일"
}

public enum AlarmTime: String, Codable, Hashable {
    case oneHourBefore = "60"
    case thirtyMinutesBefore = "30"
    case tenMinutesBefore = "10"
}

public struct Schedule: Hashable {
    public let id: Int
    public let title: String
    public let categoryImage: CategoryImage?
    public let dateAndTime: Date?
    public let isRepeating: Bool
    public let repeatDays: [Weekday]?
    public let alarm: Bool
    public let alarmTimes: [AlarmTime]?
    public let place: String?
    public let memo: String?
    public let isFinish: Bool
    
    public init(
        id: Int,
        title: String,
        categoryImage: CategoryImage? = nil,
        dateAndTime: Date? = nil,
        isRepeating: Bool,
        repeatDays: [Weekday]? = nil,
        alarm: Bool,
        alarmTimes: [AlarmTime]? = nil,
        place: String? = nil,
        memo: String? = nil,
        isFinish: Bool
    ) {
        self.id = id
        self.title = title
        self.categoryImage = categoryImage
        self.dateAndTime = dateAndTime
        self.isRepeating = isRepeating
        self.repeatDays = repeatDays
        self.alarm = alarm
        self.alarmTimes = alarmTimes
        self.place = place
        self.memo = memo
        self.isFinish = isFinish
    }
}
