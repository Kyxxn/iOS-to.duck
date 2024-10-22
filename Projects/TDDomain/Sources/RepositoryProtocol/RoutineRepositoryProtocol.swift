//
//  RoutineRepositoryProtocol.swift
//  toduck
//
//  Created by 박효준 on 6/7/24.
//

import Foundation

// MARK: 루틴 하나 상세 불러오기
public protocol RoutineRepositoryProtocol {
    func fetchRoutine() async throws -> Routine
    func fetchRoutineList() async throws -> [Routine]
    func updateRoutine(routineId: Int) async throws -> Bool
    func deleteRoutine(routineId: Int) async throws -> Bool
    func createRoutine(routine: Routine) async throws -> Bool
}
