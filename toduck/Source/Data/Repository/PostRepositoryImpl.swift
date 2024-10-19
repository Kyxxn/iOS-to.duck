//
//  SocialPostRepository.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import Foundation

public final class PostRepositoryImpl: PostRepository {
    private let dummyRoutine = Routine(id: 0, title: "", isPublic: false, isRepeating: false, isRepeatAllDay: false, alarm: false, isFinish: false)
    private let dummyUser = User(id: 0, name: "", icon: "", title: "", isblock: false)

    public init() {}

    public func fetchPostList(type: PostType, category: PostCategory) async throws -> [Post] {
        return Post.dummy.sorted { $0.timestamp > $1.timestamp }
    }

    public func searchPost(keyword: String, type: PostType, category: PostCategory) async throws -> [Post]? {
        return []
    }

    public func togglePostLike(postId: Int) async throws -> Bool {
        return false;
    }

    public func bringUserRoutine(routine: Routine) async throws -> Routine {
        return dummyRoutine
    }

    public func createPost(post: Post) async throws -> Bool {
        return false;
    }

    public func updatePost(post: Post) async throws -> Bool {
        return false;
    }

    public func deletePost(postId: Int) async throws -> Bool {
        return false;
    }

    public func fetchPost(postId: Int) async throws -> Post {
        return Post(id: 0, user: dummyUser, contentText: "", imageList: [], timestamp: Date(), likeCount: 0, isLike: false, commentCount: 0, shareCount: 0, routine: dummyRoutine, type: .communication, category: .none);
    }

    public func reportPost(postId: Int) async throws -> Bool {
        return false;
    }

    public func blockPost(postId: Int) async throws -> Bool {
        return false;
    }


}
