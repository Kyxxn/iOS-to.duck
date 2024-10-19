import Foundation

public protocol PostRepository {
    
    func fetchPostList(type: PostType, category: PostCategory) async throws -> [Post]
    func searchPost(keyword: String,type: PostType,category: PostCategory) async throws -> [Post]?
    func togglePostLike(postId: Int) async throws -> Bool
    func bringUserRoutine(routine: Routine) async throws -> Routine
    
    //MARK: - Post CRUD
    func createPost(post: Post) async throws -> Bool
    func updatePost(post: Post) async throws -> Bool
    func deletePost(postId: Int) async throws -> Bool
    func fetchPost(postId: Int) async throws -> Post
    func reportPost(postId: Int) async throws -> Bool
    func blockPost(postId: Int) async throws -> Bool
}
