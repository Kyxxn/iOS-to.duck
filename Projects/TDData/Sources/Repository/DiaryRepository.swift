//
//  DiaryRepositoryDummy.swift
//  toduck
//
//  Created by 승재 on 6/10/24.
//

import TDDomain
import Foundation

public final class DiaryRepositoryDummy: DiaryRepositoryProtocol {
    private var diaries: [Diary] = []
    private var nextId = 1
    
    public init() { }
    
    public func fetchDiary(id: Int) async throws -> Diary {
        guard let diary = diaries.first(where: { $0.id == id }) else {
            throw NSError(domain: "DiaryNotFound", code: 404, userInfo: nil)
        }
        return diary
    }
    
    public func fetchDiaryList(from startDate: Date, to endDate: Date) async throws -> [Diary] {
        return diaries.filter { $0.date >= startDate && $0.date <= endDate }
    }
    
    public func addDiary(diary: Diary) async throws -> Diary {
        let newDiary = diary
        diaries.append(newDiary)
        return newDiary
    }
    
    public func updateDiary(diary: Diary) async throws -> Diary {
        guard let index = diaries.firstIndex(where: { $0.id == diary.id }) else {
            throw NSError(domain: "DiaryNotFound", code: 404, userInfo: nil)
        }
        diaries[index] = diary
        return diary
    }
    
    public func deleteDiary(id: Int) async throws -> Bool {
        guard let index = diaries.firstIndex(where: { $0.id == id }) else {
            throw NSError(domain: "DiaryNotFound", code: 404, userInfo: nil)
        }
        diaries.remove(at: index)
        return true
    }
}
