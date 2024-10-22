//
//  CreateSchedule.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import Foundation

public final class CreateScheduleUseCase {
    private let scheduleRepository: ScheduleRepositoryProtocol
    
    public init(scheduleRepository: ScheduleRepositoryProtocol) {
        self.scheduleRepository = scheduleRepository
    }
    
    public func execute(schedule: Schedule) async throws -> Bool {
        return try await scheduleRepository.createSchedule(schedule: schedule)
    }
}
