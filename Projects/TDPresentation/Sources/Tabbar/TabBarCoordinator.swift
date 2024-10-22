//
//  TabbarCoordinator.swift
//  toduck
//
//  Created by 박효준 on 7/16/24.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    var finishDelegate: CoordinatorFinishDelegate?
    
    lazy var tabBarController: MainTabBarController = {
        return MainTabBarController(coordinator: self)
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let items: [UINavigationController] = TabbarItem.allCases.map { createNavigationController(item: $0) }
        configureTabBarController(with: items)
    }
    
    // setViewControllers 메소드의 파라미터가 [UIVC]이므로 start()의 items 업캐스팅
    private func configureTabBarController(with viewControllers: [UIViewController]) {
        navigationController.setNavigationBarHidden(true, animated: false)
        tabBarController.setViewControllers(viewControllers, animated: false)
        navigationController.viewControllers = [tabBarController]
    }
    
    private func createNavigationController(item: TabbarItem) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.tabBarItem = item.item
        configureCoordinator(item: item, navigationController: navigationController)
        
        return navigationController
    }
    
    private func configureCoordinator(item: TabbarItem, navigationController: UINavigationController) {
        switch item {
        case .home:
            let coordinator = HomeCoordinator(navigationController: navigationController)
            addCoordinator(coordinator: coordinator)
        case .timer:
            let coordinator = TimerCoordinator(navigationController: navigationController)
            addCoordinator(coordinator: coordinator)
        case .diary:
            let coordinator = DiaryCoordinator(navigationController: navigationController)
            addCoordinator(coordinator: coordinator)
        case .social:
            let coordinator = SocialCoordinator(navigationController: navigationController)
            addCoordinator(coordinator: coordinator)
        case .mypage:
            let coordinator = MyPageCoordinator(navigationController: navigationController)
            addCoordinator(coordinator: coordinator)
        }
    }
    
    private func addCoordinator(coordinator: Coordinator) {
        coordinator.finishDelegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}

extension TabBarCoordinator: CoordinatorFinishDelegate {
    func didFinish(childCoordinator: any Coordinator) {
        // MARK: TabBarItem 자식 뷰컨 하나만 종료됐음을 알림
        if let index = childCoordinators.firstIndex(where: { $0 === childCoordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
