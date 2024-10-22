//
//  SocialCommentRepository.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import TDDomain
import Foundation

public final class CommentRepository: CommentRepositoryProtocol {
    public init() { }
    
    public func toggleCommentLike(commentId: Int) async throws -> Bool {
        return false
    }
    
    public func fetchCommentList(commentId: Int) async throws -> [Comment]? {
        return []
    }
    
    public func fetchUserCommentList(userId: Int) async throws -> [Comment]? {
        return []
    }
    
    public func createComment(comment: Comment) async throws -> Bool {
        return false
    }
    
    public func updateComment(comment: Comment) async throws -> Bool {
        return false
    }
    
    public func deleteComment(commentId: Int) async throws -> Bool {
        return false
    }
    
    public func reportComment(commentId: Int) async throws -> Bool {
        return false
    }
    
    public func blockComment(commentId: Int) async throws -> Bool {
        return false
    }
}
