//
//  MyPageCoordinator.swift
//  toduck
//
//  Created by 박효준 on 7/16/24.
//

import UIKit

final class MyPageCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [any Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let myPageViewController = MyPageViewController()
        navigationController.pushViewController(myPageViewController, animated: false)
    }
}
