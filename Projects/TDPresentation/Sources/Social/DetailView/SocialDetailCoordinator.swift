import TDData
import TDDomain
import UIKit

final class SocialDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [any Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?

    let postID: Int
    
    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.postID = id
    }

    func start() {
        let postRepository = PostRepositoryImpl()
        let fetchPostUseCase = FetchPostUseCaseImpl(repository: postRepository)
        let likePostUseCase = TogglePostLikeUseCaseImpl(repository: postRepository)
        let createCommentUseCase = CreateCommentUseCaseImpl(repository: CommentRepository())
        let reportPostUseCase = ReportPostUseCaseImpl(repository: postRepository)
        
        let socialDetailViewModel = SocialDetailViewModel(
            fetchPostUsecase: fetchPostUseCase,
            likePostUseCase: likePostUseCase,
            createCommentUseCase: createCommentUseCase,
            reportPostUseCase: reportPostUseCase,
            at: postID
        )
        
        let socialDetailViewController = SocialDetailViewController()
        socialDetailViewController.coordinator = self
        navigationController.pushViewController(socialDetailViewController, animated: true)
    }
}
