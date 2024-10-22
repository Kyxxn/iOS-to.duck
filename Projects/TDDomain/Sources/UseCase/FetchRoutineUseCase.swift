//
//  FetchRoutineUseCase.swift
//  toduck
//
//  Created by 박효준 on 6/6/24.
//

import Foundation

public final class FetchRoutineUseCase {
    private let routineRepository: RoutineRepositoryProtocol
    
    public init(routineRepository: RoutineRepositoryProtocol) {
        self.routineRepository = routineRepository
    }
    
    public func execute() async throws -> Routine {
        return try await routineRepository.fetchRoutine()
    }
}
