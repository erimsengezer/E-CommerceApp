//
//  SplashBuilder.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
// 

import UIKit

enum SplashBuilder {
    
    static func generate(coordinator: SplashCoordinatorProtocol) -> UIViewController? {
        let repository: SplashRepositoryProtocol = SplashRepository()
        let viewModel: SplashViewModelProtocol = SplashViewModel(repository: repository, coordinator: coordinator)

        let view: SplashViewProtocol = SplashViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view as? UIViewController
    }
}
