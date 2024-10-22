//
//  Social.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import Foundation

public enum PostType {
    case communication
    case question
}

public enum PostCategory: String {
    case all = "전체"
    case concentration = "집중력"
    case memory = "기억력"
    case impulse = "충동"
    case anxiety = "불안"
    case sleep = "수면"
}

public struct Post: Identifiable {
    public init(
        id: Int,
        user: User,
        contentText: String,
        imageList: [String]?,
        timestamp: Date,
        likeCount: Int?,
        isLike: Bool,
        commentCount: Int?,
        shareCount: Int?,
        routine: Routine?,
        type: PostType,
        category: [PostCategory]?
    ) {
        self.id = id
        self.user = user
        self.contentText = contentText
        self.imageList = imageList
        self.timestamp = timestamp
        self.likeCount = likeCount
        self.isLike = isLike
        self.commentCount = commentCount
        self.shareCount = shareCount
        self.routine = routine
        self.type = type
        self.category = category
    }

    public let id: Int
    public let user: User
    public let contentText: String
    public let imageList: [String]?
    public let timestamp: Date
    
    public let likeCount: Int?
    public var isLike: Bool
    public let commentCount: Int?
    public let shareCount: Int?
    public let routine: Routine?
    
    //보이지 않는 property
    public let type: PostType
    public let category: [PostCategory]?
}

extension Post {
    public static let dummy : [Post] = [Post(id: 1,
                               user: .init(id: 1, name: "오리발", icon: "https://avatars.githubusercontent.com/u/46300191?v=4", title: "작심삼일", isblock: false),
                               contentText: "콘서타는 먹었는데 다른 약 먹는걸 깜빡했다.. 요새 매일 이러네 ㅠㅠ 저만 이런가요?콘서타는 먹었는데 다른 약 먹는걸 깜빡했다.. 요새 매일 이러네 ㅠㅠ 저만 이런가요? ",
                               imageList: ["https://pbs.twimg.com/media/EFHWmyXUEAASe0o.jpg", "https://pbs.twimg.com/media/EHsTI9GUcAAOvS1.jpg:small"],
                              timestamp: DateComponents(calendar: .current, year: 2024, month: 6, day: 13, hour: 13, minute: 30).date!,
                               likeCount: 21,
                               isLike: true,
                               commentCount: 3,
                               shareCount: nil,
                               routine: nil,
                               type: .communication,
                               category: [.anxiety]),
                          Post(id: 2,
                               user: .init(id: 2, name: "꽉꽉", icon: "https://avatars.githubusercontent.com/u/129862357?v=4", title: "작심삼일", isblock: false),
                               contentText: "어제 잠들기 전 새로운 루틴을 추가했다👀\n덕분에 오늘은 까먹는 일 없이 장 챙김✌️",
                               imageList: ["https://pbs.twimg.com/media/EHsTI9GUcAAOvS1.jpg:small","https://pbs.twimg.com/media/EHsTI9GUcAAOvS1.jpg:small"
                                          ,"https://pbs.twimg.com/media/EHsTI9GUcAAOvS1.jpg:small"
                                          ,"https://pbs.twimg.com/media/EHsTI9GUcAAOvS1.jpg:small"
                                          ,"https://pbs.twimg.com/media/EHsTI9GUcAAOvS1.jpg:small"],
                               timestamp: DateComponents(calendar: .current, year: 2024, month: 10, day: 13, hour: 13, minute: 30).date!,
                               likeCount: 46,
                               isLike: false,
                               commentCount: 3,
                               shareCount: 12,
                               routine: Routine(id: 1, title: "✌️ 나가기 전 잊지 말고 챙기자나가기 전 잊지 말고 챙기자나가기 전 잊지 말고 챙기자", category: "일", isPublic: true, dateAndTime: .now, isRepeating: true, isRepeatAllDay: false, repeatDays: [.monday,.friday], alarm: true, alarmTimes: [.oneHourBefore], memo: "지갑, 차키, 에어팟, 접이식우산,지갑, 차키, 에어팟, 접이식우산,지갑, 차키, 에어팟, 접이식우산", recommendedRoutines: nil, isFinish: false),
                               type: .communication,
                               category: [.anxiety]),
                          Post(id: 3,
                               user: .init(id: 3, name: "오리궁뎅이", icon: "https://avatars.githubusercontent.com/u/57449485?v=4", title: "작심삼일", isblock: false),
                               contentText: "오늘은 피곤해서 진짜 일찍 자고싶은데 ㅠㅠ 잠이 안와서 괴로워요ㅠㅠㅠㅠㅠ",
                               imageList: nil,
                               timestamp: .now,
                               likeCount: 46,
                               isLike: true,
                               commentCount: 1,
                               shareCount: 12,
                               routine: nil,
                               type: .communication,
                               category: [.anxiety]),
                          Post(id: 4,
                               user: .init(id: 76, name: "꽉꽉", icon: nil, title: "작심삼일", isblock: false),
                               contentText: "어제 잠들기 전 새로운 루틴을 추가했다👀\n덕분에 오늘은 까먹는 일 없이 장 챙김✌️",
                               imageList: nil,
                               timestamp: .now,
                               likeCount: 46,
                               isLike: false,
                               commentCount: 7,
                               shareCount: 12,
                               routine: Routine(id: 12, title: "✌️ 나가기 전 잊지 말고 챙기자", category: "일", isPublic: true, dateAndTime: .now, isRepeating: true, isRepeatAllDay: false, repeatDays: [.monday,.friday], alarm: true, alarmTimes: [.oneHourBefore], memo: "지갑, 차키, 에어팟, 접이식우산", recommendedRoutines: nil, isFinish: false),
                               type: .communication,
                               category: [.anxiety]),
                          Post(id: 5,
                               user: .init(id: 33, name: "오리궁뎅이", icon: nil, title: "작심삼일", isblock: false),
                               contentText: "오늘은 피곤해서 진짜 일찍 자고싶은데 ㅠㅠ 잠이 안와서 괴로워요ㅠㅠㅠㅠㅠ",
                               imageList: nil,
                               timestamp: .now,
                               likeCount: 46,
                               isLike: true,
                               commentCount: 7,
                               shareCount: 12,
                               routine: nil,
                               type: .communication,
                               category: [.anxiety])
    ]
}

extension Post: Equatable {
    public static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Post: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
