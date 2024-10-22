//
//  Routine.swift
//  toduck
//
//  Created by 박효준 on 5/31/24.
//

import Foundation

struct RecommendedRoutine: Hashable {
    let title: String
    let time: Date? // AM 07:30
    let memo: String?
}

public struct Routine: Hashable {
    public let id: Int
    public let title: String
    public let category: String? // 일정의 이모티콘 아님
    public let isPublic: Bool
    public let dateAndTime: Date?
    public let isRepeating: Bool
    public let isRepeatAllDay: Bool // 반복이 종일인지
    public let repeatDays: [Weekday]?
    public let alarm: Bool
    public let alarmTimes: [AlarmTime]?
    public let memo: String?
    public let recommendedRoutines: [String]?
    public let isFinish: Bool
    
    public init(
        id: Int,
        title: String,
        category: String? = nil,
        isPublic: Bool,
        dateAndTime: Date? = nil,
        isRepeating: Bool,
        isRepeatAllDay: Bool,
        repeatDays: [Weekday]? = nil,
        alarm: Bool,
        alarmTimes: [AlarmTime]? = nil,
        memo: String? = nil,
        recommendedRoutines: [String]? = nil,
        isFinish: Bool
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.isPublic = isPublic
        self.dateAndTime = dateAndTime
        self.isRepeating = isRepeating
        self.isRepeatAllDay = isRepeatAllDay
        self.repeatDays = repeatDays
        self.alarm = alarm
        self.alarmTimes = alarmTimes
        self.memo = memo
        self.recommendedRoutines = recommendedRoutines
        self.isFinish = isFinish
    }
}
