//
//  ScheduleTarget.swift
//  toduck
//
//  Created by 승재 on 7/9/24.
//

import TDDomain
import Foundation
import Moya

public enum ScheduleTarget {
    case fetchSchedule(scheduleId: Int) // 특정 일정 조회
    case fetchScheduleList // 모든 일정 조회
    case moveTomorrowSchedule(scheduleId: Int) // 일정 내일로 이동
    case createSchedule(schedule: Schedule) // 일정 생성
    case updateSchedule(scheduleId: Int, schedule: Schedule) // 일정 업데이트
    case deleteSchedule(scheduleId: Int) // 일정 삭제
}

extension ScheduleTarget: TargetType {
    public var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }

    public var path: String {
        switch self {
        case .fetchSchedule(let scheduleId):
            return "/schedules/\(scheduleId)"
        case .fetchScheduleList:
            return "/schedules"
        case .moveTomorrowSchedule(let scheduleId):
            return "/schedules/\(scheduleId)/move-tomorrow"
        case .createSchedule:
            return "/schedules"
        case .updateSchedule(let scheduleId, _):
            return "/schedules/\(scheduleId)"
        case .deleteSchedule(let scheduleId):
            return "/schedules/\(scheduleId)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchSchedule,
             .fetchScheduleList:
            return .get
        case .moveTomorrowSchedule, 
             .createSchedule,
             .updateSchedule:
            return .post
        case .deleteSchedule:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchSchedule,
             .fetchScheduleList:
            return .requestPlain
        case .moveTomorrowSchedule,
             .deleteSchedule:
            return .requestPlain
        case .createSchedule(let schedule), 
             .updateSchedule(_, let schedule):
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
        var headers: [String: String] = ["Content-Type": "application/json"]
// MARK: 나중에 토큰 관리 회의 후 결정
//        if let accessToken = TokenManager.shared.accessToken {
//            headers["Authorization"] = "Bearer \(accessToken)"
//        }
        return headers
    }
    
    public var sampleData: Data {
        switch self {
        case .fetchSchedule:
            return """
            {
                "id": 1,
                "title": "회의",
                "categoryImage": "a",
                "dateAndTime": "2024-07-10T09:00:00Z",
                "isRepeating": true,
                "repeatDays": ["월", "수", "금"],
                "alarm": true,
                "alarmTimes": ["60", "30"],
                "place": "디스코드"
                "memo": "프로젝트 진행 상황 점검",
                "isFinish": false
            }
            """.data(using: .utf8)!
        case .fetchScheduleList:
            return """
            [
                {
                    "id": 1,
                    "title": "회의",
                    "categoryImage": "a",
                    "dateAndTime": "2024-07-10T09:00:00Z",
                    "isRepeating": true,
                    "repeatDays": ["월", "수", "금"],
                    "alarm": true,
                    "alarmTimes": ["60", "30"],
                    "place": "디스코드",
                    "memo": "프로젝트 진행 상황 점검",
                    "isFinish": false
                },
                {
                    "id": 2,
                    "title": "운동",
                    "categoryImage": "a",
                    "dateAndTime": "2024-07-11T18:00:00Z",
                    "isRepeating": false,
                    "repeatDays": null,
                    "alarm": true,
                    "alarmTimes": ["10"],
                    "place": "헬스장",
                    "memo": "웨이트 운동 1회",
                    "isFinish": false
                }
            ]
            """.data(using: .utf8)!
        case .createSchedule, .updateSchedule:
            return """
            {
                "id": 1,
                "title": "회의",
                "categoryImage": "a",
                "dateAndTime": "2024-07-10T09:00:00Z",
                "isRepeating": true,
                "repeatDays": ["월", "수", "금"],
                "alarm": true,
                "alarmTimes": ["60", "30"],
                "place": "디스코드",
                "memo": "프로젝트 진행 상황 점검",
                "isFinish": false
            }
            """.data(using: .utf8)!
        case .deleteSchedule:
            return """
            {
                "success": true
            }
            """.data(using: .utf8)!
        case .moveTomorrowSchedule(scheduleId: let scheduleId):
            return """
            {
                "success": true
            }
            """.data(using: .utf8)!
        }
    }
}
