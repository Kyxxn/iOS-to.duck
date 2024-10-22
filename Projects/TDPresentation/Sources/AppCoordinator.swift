//
//  AppCoordinator.swift
//  toduck
//
//  Created by 박효준 on 7/15/24.
//

import UIKit

public final class AppCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [any Coordinator] = []
    public var finishDelegate: CoordinatorFinishDelegate?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}
