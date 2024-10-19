import Foundation

protocol FetchPostUseCase {
    func execute(type: PostType, category: PostCategory) async throws -> [Post]?
    func execute(postId: Int) async throws -> Post?
}

public final class FetchPostUseCaseImpl: FetchPostUseCase {
    private let repository: PostRepository
    
    public init(repository: PostRepository) {
        self.repository = repository
    }
    
    public func execute(type: PostType, category: PostCategory) async throws -> [Post]? {
        return try await repository.fetchPostList(type: type, category: category)
    }
    
    public func execute(postId: Int) async throws -> Post? {
        return try await repository.fetchPost(postId: postId)
    }
}
