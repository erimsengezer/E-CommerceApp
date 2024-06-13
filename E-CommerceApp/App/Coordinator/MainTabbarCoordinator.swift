//
//  MainTabbarCoordinator.swift
//  Gymi
//
//  Created by erimsengezer on 26.04.2024.
//

import UIKit

class MainTabbarCoordinator: RootableCoordinator {
    
    private lazy var mainTabbarController: MainTabBarController = {
        return MainTabBarController()
    }()
    
    override func start() {
        let mainScreenNavigationController = UINavigationController()
        mainScreenNavigationController.tabBarItem.title = MainTabbarTitle.list.rawValue
        let mainScreenCoordinator = MainCoordinator(navigationController: mainScreenNavigationController)
        
        mainTabbarController.viewControllers = [mainScreenNavigationController]
        
        window?.rootViewController = mainTabbarController
        window?.makeKeyAndVisible()
        
        
        // Coordinate to first controllers for tabs
        coordinate(to: mainScreenCoordinator)
    }
}
