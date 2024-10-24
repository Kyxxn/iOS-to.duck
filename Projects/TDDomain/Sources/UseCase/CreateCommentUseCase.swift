//
//  CreateCommentUseCase.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public protocol CreateCommentUseCase {
    func execute(comment: Comment) async throws -> Bool
}

public final class CreateCommentUseCaseImpl: CreateCommentUseCase {
    private let repository: CommentRepository
    
    public init(repository: CommentRepository) {
        self.repository = repository
    }
    
    public func execute(comment: Comment) async throws -> Bool {
        return try await repository.createComment(comment: comment)
    }
}
