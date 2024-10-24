//
//  ReportCommentUseCase.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public final class ReportCommentUseCase {
    private let repository: CommentRepository
    
    public init(repository: CommentRepository) {
        self.repository = repository
    }
    
    public func execute(comment: Comment) async throws -> Bool {
        return try await repository.reportComment(commentId: comment.id)
    }
}
