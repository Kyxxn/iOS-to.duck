//
//  MainTabBarController.swift
//  toduck
//
//  Created by 박효준 on 7/16/24.
//

import TDDesign
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    weak var coordinator: TabBarCoordinator?
    
    init(coordinator: TabBarCoordinator? = nil) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.backgroundColor = TDColor.baseWhite
        tabBar.tintColor = TDColor.Primary.primary400
        tabBar.unselectedItemTintColor = TDColor.Neutral.neutral600
    }
}
