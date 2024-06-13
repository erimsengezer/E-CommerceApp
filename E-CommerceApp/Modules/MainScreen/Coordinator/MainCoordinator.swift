//
//  MainCoordinator.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

protocol MainCoordinatorProtocol: AnyObject {
    
}

final class MainCoordinator: NavigationCoordinator , MainCoordinatorProtocol {

     override func start() {
         guard let controller = MainBuilder.generate(coordinator: self) else { return }
         navigationController.pushViewController(controller, animated: true)
     }
}
