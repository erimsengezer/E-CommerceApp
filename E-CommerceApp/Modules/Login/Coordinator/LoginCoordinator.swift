//
//  LoginCoordinator.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

protocol LoginCoordinatorProtocol: AnyObject {
    
}

final class LoginCoordinator: RootableCoordinator, LoginCoordinatorProtocol {

     override func start() {
         let controller = LoginBuilder.generate(coordinator: self)
         window?.rootViewController = controller
         window?.makeKeyAndVisible()
     }
}
