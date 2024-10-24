import TDCore
import TDDomain
import UIKit

final class SocialCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [any Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?
    var injector: DependencyResolvable = DIContainer.shared

    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {
        let fetchPostUseCase = injector.resolve(FetchPostUseCase.self)
        let togglePostLikeUseCase = injector.resolve(TogglePostLikeUseCase.self)
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
