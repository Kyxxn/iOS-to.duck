//
//  UserRepositoryProtocol.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import Foundation

public protocol UserRepositoryProtocol {
    func fetchUser(userId: Int) async throws -> User?
    func fetchUserDetail(userId: Int) async throws -> UserDetail
    func fetchUserPostList(userId: Int) async throws -> [Post]?
    func fetchUserRoutineList(userId: Int) async throws -> [Routine]?
    func fetchUserShareUrl(userId: Int) async throws -> String
    func toggleUserFollow(userId: Int,targetUserId: Int) async throws -> Bool
}
