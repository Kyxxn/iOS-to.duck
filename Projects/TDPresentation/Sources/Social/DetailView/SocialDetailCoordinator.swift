import TDCore
import TDDomain
import UIKit

final class SocialDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [any Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?
    var injector: DependencyResolvable = DIContainer.shared

    let postID: Int
    
    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.postID = id
    }

    func start() {
        let fetchPostUseCase = injector.resolve(FetchPostUseCase.self)
        let likePostUseCase = injector.resolve(TogglePostLikeUseCase.self)
        let createCommentUseCase =  injector.resolve(CreateCommentUseCase.self)
        let reportPostUseCase = injector.resolve(ReportPostUseCase.self)
        
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
