//
//  CommentRepositoryProtocol.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public protocol CommentRepository {
    func toggleCommentLike(commentId: Int) async throws -> Bool

    func fetchCommentList(commentId: Int) async throws -> [Comment]?
    func fetchUserCommentList(userId: Int) async throws -> [Comment]?
    // MARK: - Comment CRUD
    func createComment(comment: Comment) async throws -> Bool
    func updateComment(comment: Comment) async throws -> Bool
    func deleteComment(commentId: Int) async throws -> Bool
    func reportComment(commentId: Int) async throws -> Bool
    func blockComment(commentId: Int) async throws -> Bool
}
