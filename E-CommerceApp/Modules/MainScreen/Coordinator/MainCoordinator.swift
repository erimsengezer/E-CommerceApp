//
//  MainCoordinator.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

protocol MainCoordinatorProtocol: AnyObject {
    func coordinateToProductDetail(id: Int)
}

final class MainCoordinator: NavigationCoordinator , MainCoordinatorProtocol {

     override func start() {
         guard let controller = MainBuilder.generate(coordinator: self) else { return }
         navigationController.pushViewController(controller, animated: true)
     }
    
    func coordinateToProductDetail(id: Int) {
        let coordinator = ProductDetailCoordinator(navigationController: navigationController)
        coordinator.id = id
        coordinate(to: coordinator)
    }
}
