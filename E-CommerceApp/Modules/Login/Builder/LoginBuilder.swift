//
//  LoginBuilder.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
// 

import UIKit

enum LoginBuilder {
    
    static func generate(coordinator: LoginCoordinatorProtocol) -> UIViewController? {
        let repository: LoginRepositoryProtocol = LoginRepository()
        let viewModel: LoginViewModelProtocol = LoginViewModel(repository: repository, coordinator: coordinator)

        let view: LoginViewProtocol = LoginViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view as? UIViewController
    }
}
