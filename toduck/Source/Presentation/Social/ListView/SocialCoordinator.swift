import UIKit

final class SocialCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [any Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let repository = PostRepositoryImpl()
        let fetchPostUseCase = FetchPostUseCaseImpl(repository: repository)
        let togglePostLikeUseCase = TogglePostLikeUseCaseImpl(repository: repository)
        let socialViewModel = SocialViewModel(fetchPostUseCase: fetchPostUseCase, togglePostLikeUseCase: togglePostLikeUseCase)
        let socialViewController = SocialViewController(viewModel: socialViewModel)
        socialViewController.coordinator = self
        navigationController.pushViewController(socialViewController, animated: false)
    }
    
    func moveToSocialDetailController(by id: Int){
        let socialDetailCoordinator = SocialDetailCoordinator(navigationController: navigationController, id: id)
        socialDetailCoordinator.start()
    }
}
