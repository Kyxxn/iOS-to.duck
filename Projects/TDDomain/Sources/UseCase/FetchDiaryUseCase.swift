//
//  FetchDiaryUseCase.swift
//  toduck
//
//  Created by 승재 on 6/10/24.
//

import Foundation

public final class FetchDiaryUseCase {
    private let repository: DiaryRepositoryProtocol
    
    public init(repository: DiaryRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(id: Int) async throws -> Diary {
        return try await repository.fetchDiary(id: id)
    }
    
    public func execute(from startDate: Date, to endDate: Date) async throws -> [Diary] {
        return try await repository.fetchDiaryList(from: startDate, to: endDate)
    }
}
