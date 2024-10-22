//
//  UserRepository.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import TDDomain
import Foundation

public final class UserRepository: UserRepositoryProtocol {
    private let dummyUser = User(id: 0, name: "", icon: "", title: "", isblock: false)

    public init() { }

    public func fetchUser(userId: Int) async throws -> User? {
        return dummyUser
    }

    public func fetchUserDetail(userId: Int) async throws -> UserDetail {
        return UserDetail(isFollowing: false, follwingCount: 0, followerCount: 0, totalPostNReply: 0, profileURL: "String", whofollow: [], routines: [], routineShareCount: 0, posts: [])
    }

    public func fetchUserPostList(userId: Int) async throws -> [Post]? {
        return []
    }

    public func fetchUserRoutineList(userId: Int) async throws -> [Routine]? {
        return []
    }

    public func fetchUserShareUrl(userId: Int) async throws -> String {
        return ""
    }

    public func toggleUserFollow(userId: Int, targetUserId: Int) async throws -> Bool {
        return false
    }


}
