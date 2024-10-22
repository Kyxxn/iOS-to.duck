//
//  FetchCommentUseCase.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public final class FetchCommentUseCase {
    private let repository: CommentRepositoryProtocol
    
    public init(repository: CommentRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(comment: Comment) async throws -> [Comment]? {
        return try await repository.fetchCommentList(commentId: comment.id)
    }
    public func execute(user: User) async throws -> [Comment]? {
        return try await repository.fetchUserCommentList(userId: user.id)
    }
}
