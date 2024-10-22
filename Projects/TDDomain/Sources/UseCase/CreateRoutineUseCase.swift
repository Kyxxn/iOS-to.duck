//
//  CreateRoutine.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import Foundation

public final class CreateRoutineUseCase {
    private let routineRepository: RoutineRepositoryProtocol
    
    public init(routineRepository: RoutineRepositoryProtocol) {
        self.routineRepository = routineRepository
    }
    
    public func execute(routine: Routine) async throws -> Bool {
        return try await routineRepository.createRoutine(routine: routine)
    }
}
