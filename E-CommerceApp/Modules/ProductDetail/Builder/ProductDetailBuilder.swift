//
//  ProductDetailBuilder.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
// 

import UIKit

enum ProductDetailBuilder {
    
    static func generate(id: Int, coordinator: ProductDetailCoordinatorProtocol) -> UIViewController? {
        let repository: ProductDetailRepositoryProtocol = ProductDetailRepository(id: id)
        let viewModel: ProductDetailViewModelProtocol = ProductDetailViewModel(repository: repository, coordinator: coordinator)

        let view: ProductDetailViewProtocol = ProductDetailViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view as? UIViewController
    }
}
