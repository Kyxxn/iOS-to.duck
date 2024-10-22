//
//  DiaryCoordinator.swift
//  toduck
//
//  Created by 박효준 on 7/15/24.
//

import UIKit

final class DiaryCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [any Coordinator]()
    var finishDelegate: CoordinatorFinishDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let diaryViewController = DiaryViewController()
        navigationController.pushViewController(diaryViewController, animated: false)
    }
}
