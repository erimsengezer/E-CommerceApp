//
//  SplashCoordinator.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

protocol SplashCoordinatorProtocol: AnyObject {
    
}

final class SplashCoordinator: RootableCoordinator, SplashCoordinatorProtocol {

     override func start() {
         let controller = SplashBuilder.generate(coordinator: self)
         window?.rootViewController = controller
         window?.makeKeyAndVisible()
     }
    
    func startFlowMain() {
        Utils.shared.appDelegate.startFlowMain()
    }
}
