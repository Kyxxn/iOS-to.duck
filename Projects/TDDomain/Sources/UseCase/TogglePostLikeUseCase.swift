//
//  TogglePostLikeUseCase.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public protocol TogglePostLikeUseCase {
    func execute(post: Post) async throws -> Bool
}

public final class TogglePostLikeUseCaseImpl: TogglePostLikeUseCase {
    private let repository: PostRepository
    
    public init(repository: PostRepository) {
        self.repository = repository
    }
    
    public func execute(post: Post) async throws -> Bool {
        return try await repository.togglePostLike(postId: post.id)
    }
}   
