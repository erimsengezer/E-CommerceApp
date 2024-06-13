//
//  AppDelegate.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - Coordinator
        self.startAppCoordinator()
        
        return true
    }
}

// MARK: Helper funcs
extension AppDelegate {

    private func startAppCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: window)
        self.window = window
        
        self.startFlowSplash()
    }

    func startFlowSplash() {
        self.appCoordinator.start()
    }

    func startFlowMain() {
        self.appCoordinator.startFlowMain()
    }
}
