//
//  FetchScheduleListUseCase.swift
//  toduck
//
//  Created by 박효준 on 6/6/24.
//

import Foundation

public final class FetchScheduleListUseCase {
    private let scheduleListRepository: ScheduleRepositoryProtocol
    
    public init(scheduleListRepository: ScheduleRepositoryProtocol) {
        self.scheduleListRepository = scheduleListRepository
    }
    
    public func execute() async throws -> [Schedule] {
        return try await scheduleListRepository.fetchScheduleList()
    }
}
