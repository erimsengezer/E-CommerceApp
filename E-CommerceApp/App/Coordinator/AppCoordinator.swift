//
//  AppCoordinator.swift
//  Gymi
//
//  Created by erimsengezer on 26.04.2024.
//

import UIKit

protocol AppCoordinatorFlow: AnyObject {
    func startFlowMain()
}

class AppCoordinator: RootableCoordinator, AppCoordinatorFlow {

    override func start() {
        let splashCoordinator = SplashCoordinator(window: self.window)
        coordinate(to: splashCoordinator)
    }

    func startFlowMain() {
        let tabbarCoordinator = MainTabbarCoordinator(window: self.window)
        coordinate(to: tabbarCoordinator)
    }
}
