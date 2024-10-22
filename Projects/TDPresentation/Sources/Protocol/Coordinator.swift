//
//  Coordinator.swift
//  toduck
//
//  Created by 박효준 on 5/24/24.
//

import UIKit

public protocol CoordinatorFinishDelegate: AnyObject {
    func didFinish(childCoordinator: Coordinator)
}

public protocol Coordinator: AnyObject {
    var navigationController : UINavigationController { get set }
    var childCoordinators: [any Coordinator] { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }

    func start()
    func finish()
}

public extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.didFinish(childCoordinator: self)
    }
}
