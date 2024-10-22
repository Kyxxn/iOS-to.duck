//
//  SocialTarget.swift
//  toduck
//
//  Created by 승재 on 7/9/24.
//

import TDDomain
import Foundation
import Moya

public enum SocialTarget {
    case fetchPostList(type: PostType, category: PostCategory)
    case searchPost(keyword: String, type: PostType, category: PostCategory)
    case togglePostLike(postId: String)
    case bringUserRoutine(routine: Routine)
    case createPost(post: Post)
    case updatePost(post: Post)
    case deletePost(postId: String)
    case fetchPost(postId: String)
    case reportPost(postId: String)
    case blockPost(postId: String)
    
    case toggleCommentLike(commentId: String)
    case fetchCommentList(commentId: String)
    case fetchUserCommentList(userId: String)
    case createComment(comment: Comment)
    case updateComment(comment: Comment)
    case deleteComment(commentId: String)
    case reportComment(commentId: String)
    case blockComment(commentId: String)
    
    case fetchUser(userId: String)
    case fetchUserDetail(userId: String)
    case fetchUserPostList(userId: String)
    case fetchUserRoutineList(userId: String)
    case fetchUserShareUrl(userId: String)
    case toggleUserFollow(userId: String, targetUserId: String)
}

extension SocialTarget: TargetType {
    public var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    public var path: String {
        switch self {
        case .fetchPostList:
            return "/posts"
        case .searchPost:
            return "/posts/search"
        case .togglePostLike(let postId):
            return "/posts/\(postId)/like"
        case .bringUserRoutine(let routine):
            return "/routines/\(routine.id)"
        case .createPost:
            return "/posts"
        case .updatePost(let post):
            return "/posts/\(post.id)"
        case .deletePost(let postId):
            return "/posts/\(postId)"
        case .fetchPost(let postId):
            return "/posts/\(postId)"
        case .reportPost(let postId):
            return "/posts/\(postId)/report"
        case .blockPost(let postId):
            return "/posts/\(postId)/block"
            
        case .toggleCommentLike(let commentId):
            return "/comments/\(commentId)/like"
        case .fetchCommentList(let commentId):
            return "/comments/\(commentId)"
        case .fetchUserCommentList(let userId):
            return "/users/\(userId)/comments"
        case .createComment:
            return "/comments"
        case .updateComment(let comment):
            return "/comments/\(comment.id)"
        case .deleteComment(let commentId):
            return "/comments/\(commentId)"
        case .reportComment(let commentId):
            return "/comments/\(commentId)/report"
        case .blockComment(let commentId):
            return "/comments/\(commentId)/block"
            
        case .fetchUser(let userId):
            return "/users/\(userId)"
        case .fetchUserDetail(let userId):
            return "/users/\(userId)/detail"
        case .fetchUserPostList(let userId):
            return "/users/\(userId)/posts"
        case .fetchUserRoutineList(let userId):
            return "/users/\(userId)/routines"
        case .fetchUserShareUrl(let userId):
            return "/users/\(userId)/share-url"
        case .toggleUserFollow(let userId, let targetUserId):
            return "/users/\(userId)/follow/\(targetUserId)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchPostList,
                .searchPost,
                .fetchPost,
                .fetchCommentList,
                .fetchUserCommentList,
                .fetchUser,
                .fetchUserDetail,
                .fetchUserPostList,
                .fetchUserRoutineList,
                .fetchUserShareUrl,
                .bringUserRoutine:
            return .get
        case .togglePostLike,
                .createPost,
                .reportPost,
                .blockPost,
                .toggleCommentLike,
                .createComment,
                .reportComment,
                .blockComment,
                .toggleUserFollow:
            return .post
        case .updatePost, .updateComment:
            return .put
        case .deletePost, .deleteComment:
            return .delete
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .fetchPostList(let type, let category):
            return .requestParameters(parameters: ["type": type, "category": category.rawValue], encoding: URLEncoding.queryString)
        case .searchPost(let keyword, let type, let category):
            return .requestParameters(parameters: ["keyword": keyword, "type": type, "category": category.rawValue], encoding: URLEncoding.queryString)
        case .togglePostLike,
                .fetchPost,
                .reportPost,
                .blockPost,
                .toggleCommentLike,
                .fetchCommentList,
                .fetchUserCommentList,
                .fetchUser,
                .fetchUserDetail,
                .fetchUserPostList,
                .fetchUserRoutineList,
                .fetchUserShareUrl,
                .bringUserRoutine,
                .deletePost,
                .deleteComment:
            return .requestPlain
        case .createPost(let post), .updatePost(let post):
            // 수정 필요
            return .requestPlain
        case .createComment(let comment), .updateComment(let comment):
            return .requestPlain
        case .toggleUserFollow(_, _):
            return .requestPlain
        case .reportComment(commentId: let commentId):
            return .requestPlain
        case .blockComment(commentId: let commentId):
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
        case .fetchPostList:
            return """
               [
                   {
                       "id": 1,
                       "user": {
                           "id": 1,
                           "name": "toduck",
                           "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                           "title": "작심삼일",
                           "isblock": false
                       },
                       "contentText": "테스트 게시물 내용입니다.",
                       "imageList": ["https://geojecci.korcham.net/images/no-image01.gif", "https://geojecci.korcham.net/images/no-image01.gif"],
                       "timestamp": "2024-07-10T09:00:00Z",
                       "likeCount": 10,
                       "isLike": true,
                       "commentCount": 5,
                       "shareCount": 2,
                       "routine": null,
                       "type": "communication",
                       "category": ["집중력", "기억력"]
                   }
               ]
               """.data(using: .utf8)!
        case .searchPost:
            return """
               [
                   {
                       "id": 2,
                       "user": {
                           "id": 2,
                           "name": "toduck2",
                           "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                           "title": "작심삼일",
                           "isblock": false
                       },
                       "contentText": "테스트 게시물",
                       "imageList": ["https://geojecci.korcham.net/images/no-image01.gif"],
                       "timestamp": "2024-07-11T09:00:00Z",
                       "likeCount": 5,
                       "isLike": false,
                       "commentCount": 2,
                       "shareCount": 1,
                       "routine": null,
                       "type": "question",
                       "category": ["충동"]
                   }
               ]
               """.data(using: .utf8)!
        case .togglePostLike:
            return """
               {
                   "success": true
               }
               """.data(using: .utf8)!
        case .bringUserRoutine:
            return """
               {
                   "id": 1,
                   "title": "아침 루틴",
                   "category": "건강",
                   "isPublic": true,
                   "dateAndTime": "2024-07-10T07:00:00Z",
                   "isRepeating": true,
                   "isRepeatAllDay": false,
                   "repeatDays": ["월", "수", "금"],
                   "alarm": true,
                   "alarmTimes": ["60"],
                   "memo": "스트레칭으로 시작하기",
                   "recommendedRoutines": ["달리기", "요가"],
                   "isFinish": false
               }
               """.data(using: .utf8)!
        case .createPost, .updatePost:
            return """
               {
                   "id": 3,
                   "user": {
                       "id": 3,
                       "name": "toduck3",
                       "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                       "title": "작심삼일",
                       "isblock": false
                   },
                   "contentText": "테스트 새로운 게시물입니다.",
                   "imageList": ["https://geojecci.korcham.net/images/no-image01.gif"],
                   "timestamp": "2024-07-12T09:00:00Z",
                   "likeCount": 0,
                   "isLike": false,
                   "commentCount": 0,
                   "shareCount": 0,
                   "routine": null,
                   "type": "communication",
                   "category": ["불안"]
               }
               """.data(using: .utf8)!
        case .deletePost:
            return """
               {
                   "success": true
               }
               """.data(using: .utf8)!
        case .fetchPost:
            return """
               {
                   "id": 1,
                   "user": {
                       "id": 1,
                       "name": "toduck",
                       "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                       "title": "작심삼일",
                       "isblock": false
                   },
                   "contentText": "테스트 게시물 내용입니다.",
                   "imageList": ["https://geojecci.korcham.net/images/no-image01.gif", "https://geojecci.korcham.net/images/no-image01.gif"],
                   "timestamp": "2024-07-10T09:00:00Z",
                   "likeCount": 10,
                   "isLike": true,
                   "commentCount": 5,
                   "shareCount": 2,
                   "routine": null,
                   "type": "communication",
                   "category": ["집중력", "기억력"]
               }
               """.data(using: .utf8)!
        case .reportPost, .blockPost:
            return """
               {
                   "success": true
               }
               """.data(using: .utf8)!
        case .toggleCommentLike, .fetchCommentList, .fetchUserCommentList, .createComment, .updateComment, .deleteComment, .reportComment, .blockComment:
            return """
               {
                   "id": 1,
                   "user": {
                       "id": 1,
                       "name": "toduck",
                       "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                       "title": "작심삼일",
                       "isblock": false
                   },
                   "content": "테스트 댓글입니다.",
                   "timestamp": "2024-07-10T09:00:00Z",
                   "isLike": true,
                   "like": 5
               }
               """.data(using: .utf8)!
        case .fetchUser, .fetchUserDetail:
            return """
               {
                   "id": 1,
                   "name": "toduck",
                   "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                   "title": "작심삼일",
                   "isblock": false
               }
               """.data(using: .utf8)!
        case .fetchUserPostList:
            return """
               [
                   {
                       "id": 1,
                       "user": {
                           "id": 1,
                           "name": "toduck",
                           "icon": "https://geojecci.korcham.net/images/no-image01.gif",
                           "title": "작심삼일",
                           "isblock": false
                       },
                       "contentText": "테스트 게시물 내용입니다.",
                       "imageList": ["https://geojecci.korcham.net/images/no-image01.gif", "https://geojecci.korcham.net/images/no-image01.gif"],
                       "timestamp": "2024-07-10T09:00:00Z",
                       "likeCount": 10,
                       "isLike": true,
                       "commentCount": 5,
                       "shareCount": 2,
                       "routine": null,
                       "type": "communication",
                       "category": ["집중력", "기억력"]
                   }
               ]
               """.data(using: .utf8)!
        case .fetchUserRoutineList:
            return """
               [
                   {
                       "id": 1,
                       "title": "아침 루틴",
                       "category": "건강",
                       "isPublic": true,
                       "dateAndTime": "2024-07-10T07:00:00Z",
                       "isRepeating": true,
                       "isRepeatAllDay": false,
                       "repeatDays": ["월", "수", "금"],
                       "alarm": true,
                       "alarmTimes": ["60"],
                       "memo": "스트레칭으로 시작하기",
                       "recommendedRoutines": ["달리기", "요가"],
                       "isFinish": false
                   }
               ]
               """.data(using: .utf8)!
        case .fetchUserShareUrl:
            return """
               {
                   "url": "https://example.com/share/user1"
               }
               """.data(using: .utf8)!
        case .toggleUserFollow:
            return """
               {
                   "success": true
               }
               """.data(using: .utf8)!
        }
    }
}

