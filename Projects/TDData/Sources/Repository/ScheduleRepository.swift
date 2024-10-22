//
//  ScheduleRepository.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import TDDomain
import Foundation

public final class ScheduleRepository: ScheduleRepositoryProtocol {
    public init() { }
    
    public func fetchSchedule() async throws -> Schedule {
        return Schedule(id: 1, title: "asd", isRepeating: false, alarm: false, isFinish: false)
    }
    
    public func fetchScheduleList() async throws -> [Schedule] {
        return [Schedule(id: 1, title: "asd", isRepeating: false, alarm: false, isFinish: false)]
    }
    
    public func moveTomorrowSchedule(scheduleId: Int) async throws -> Bool {
        return false
    }
    
    public func createSchedule(schedule: Schedule) async throws -> Bool {
        return false
    }
    
    
    public func updateSchedule(scheduleId: Int) async throws -> Bool {
        return false
    }
    
    public func deleteSchedule(scheduleId: Int) async throws -> Bool {
        return false
    }
}
