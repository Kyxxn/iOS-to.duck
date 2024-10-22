//
//  FetchRoutineListUseCase.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import Foundation

public final class FetchRoutineListUseCase {
    private let routineListRepository: RoutineRepositoryProtocol
    
    public init(routineListRepository: RoutineRepositoryProtocol) {
        self.routineListRepository = routineListRepository
    }
    
    public func execute() async throws -> [Routine] {
        return try await routineListRepository.fetchRoutineList()
    }
}
