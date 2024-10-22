//
//  DiaryTarget.swift
//  toduck
//
//  Created by 승재 on 7/9/24.
//

import Foundation
import TDDomain
import Moya

public enum DiaryTarget {
    case fetchDiary(id: Int) // 특정 다이어리 조회
    case fetchDiaryList(from: Date, to: Date) // 다이어리 리스트 조회
    case addDiary(diary: Diary) // 다이어리 추가
    case updateDiary(diary: Diary) // 다이어리 업데이트
    case deleteDiary(id: Int) // 다이어리 삭제
}

extension DiaryTarget: TargetType {
    public var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }

    public var path: String {
        switch self {
        case .fetchDiary(let id):
            return "/diary/\(id)"
        case .fetchDiaryList:
            return "/diary"
        case .addDiary:
            return "/diary"
        case .updateDiary(let diary):
            return "/diary/\(diary.id)"
        case .deleteDiary(let id):
            return "/diary/\(id)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchDiary, .fetchDiaryList:
            return .get
        case .addDiary:
            return .post
        case .updateDiary:
            return .put
        case .deleteDiary:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchDiary, .deleteDiary:
            return .requestPlain
        case .fetchDiaryList(let from, let to):
            let dateFormatter = ISO8601DateFormatter()
            let parameters: [String: String] = [
                "from": dateFormatter.string(from: from),
                "to": dateFormatter.string(from: to)
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .addDiary(let diary), .updateDiary(let diary):
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
        var headers: [String: String] = ["Content-Type": "application/json"]
//        if let accessToken = TokenManager.shared.accessToken {
//            headers["Authorization"] = "Bearer \(accessToken)"
//        }
        return headers
    }
    
    public var sampleData: Data {
            switch self {
            case .fetchDiary:
                return """
                {
                    "id": 1,
                    "focus": {"focusPercent": 75, "focusTime": {"hours": 2, "minutes": 30}},
                    "emotion": {"name": "행복"},
                    "contentText": "오늘은 행복한 날",
                    "date": "2024-07-10T12:34:56Z"
                }
                """.data(using: .utf8)!
            case .fetchDiaryList:
                return """
                [
                    {
                        "id": 1,
                        "focus": {"focusPercent": 75, "focusTime": {"hours": 2, "minutes": 30}},
                        "emotion": {"name": "행복"},
                        "contentText": "오늘은 행복한 날",
                        "date": "2024-07-10T12:34:56Z"
                    },
                    {
                        "id": 2,
                        "focus": {"focusPercent": 50, "focusTime": {"hours": 1, "minutes": 45}},
                        "emotion": {"name": "슬픔"},
                        "contentText": "오늘은 슬픈 날",
                        "date": "2024-07-11T14:22:33Z"
                    }
                ]
                """.data(using: .utf8)!
            case .addDiary, .updateDiary:
                return """
                {
                    "id": 1,
                    "focus": {"focusPercent": 75, "focusTime": {"hours": 2, "minutes": 30}},
                    "emotion": {"name": "행복"},
                    "contentText": "오늘은 행복한 날",
                    "date": "2024-07-10T12:34:56Z"
                }
                """.data(using: .utf8)!
            case .deleteDiary:
                return """
                {
                    "success": true
                }
                """.data(using: .utf8)!
            }
        }
}
