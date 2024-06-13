//
//  ProductDetailCoordinator.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

protocol ProductDetailCoordinatorProtocol: AnyObject {
    var id: Int { get }
    
    func popViewController()
}


final class ProductDetailCoordinator: NavigationCoordinator, ProductDetailCoordinatorProtocol {
    var id: Int = 0
    
     override func start() {
         guard let controller = ProductDetailBuilder.generate(id: id, coordinator: self) else { return }
         navigationController.pushViewController(controller, animated: true)
     }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}
