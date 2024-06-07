//
//  ScheduleRepositoryProtocol.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import Foundation

// MARK: 일정 하나 상세 불러오기
protocol ScheduleRepositoryProtocol {
    func fetchSchedule() async throws -> Schedule
    func updateSchedule(scheduleId: Int) async throws -> Bool
    func deleteSchedule(scheduleId: Int) async throws -> Bool
    // 매개변수 추가해야 함
    func createSchedule() async throws -> Bool
}
