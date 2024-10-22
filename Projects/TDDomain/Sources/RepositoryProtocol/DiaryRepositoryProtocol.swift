//
//  DiaryRepositoryProtocol.swift
//  toduck
//
//  Created by 승재 on 6/10/24.
//

import Foundation

public protocol DiaryRepositoryProtocol {
    func fetchDiary(id: Int) async throws -> Diary
    func fetchDiaryList(from startDate: Date, to endDate: Date) async throws -> [Diary]
    func addDiary(diary: Diary) async throws -> Diary
    func updateDiary(diary: Diary) async throws -> Diary
    func deleteDiary(id: Int) async throws -> Bool
}
