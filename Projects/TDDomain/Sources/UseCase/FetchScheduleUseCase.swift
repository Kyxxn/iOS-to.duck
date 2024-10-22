//
//  FetchScheduleUseCase.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import Foundation

public final class FetchScheduleUseCase {
    private let scheduleRepository: ScheduleRepositoryProtocol
    
    public init(scheduleRepository: ScheduleRepositoryProtocol) {
        self.scheduleRepository = scheduleRepository
    }
    
    public func execute() async throws -> Schedule {
        return try await scheduleRepository.fetchSchedule()
    }
}
