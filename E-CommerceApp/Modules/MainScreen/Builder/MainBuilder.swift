//
//  MainBuilder.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
// 

import UIKit

enum MainBuilder {
    
    static func generate(coordinator: MainCoordinatorProtocol) -> UIViewController? {
        let repository: MainRepositoryProtocol = MainRepository()
        let viewModel: MainViewModelProtocol = MainViewModel(repository: repository, coordinator: coordinator)

        let view: MainViewProtocol = MainViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view as? UIViewController
    }
}
