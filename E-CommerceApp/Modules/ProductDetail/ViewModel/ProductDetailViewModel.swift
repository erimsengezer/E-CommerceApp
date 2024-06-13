//
//  ProductDetailViewModel.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol ProductDetailViewModelProtocol: AnyObject {
    var view: ProductDetailViewProtocol? { get set }
    
    func viewDidLoad()
}

final class ProductDetailViewModel: ProductDetailViewModelProtocol {

    // MARK: Definitions
    private let repository: ProductDetailRepositoryProtocol
    private let coordinator: ProductDetailCoordinatorProtocol
    weak var view: ProductDetailViewProtocol?
    
    // MARK: Private Props

    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: ProductDetailRepositoryProtocol, coordinator: ProductDetailCoordinatorProtocol ) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        getProduct()
    }
    
    func getProduct() {
        repository.getProduct { [weak self] data in
            do {
                let responseModel = try JSONDecoder().decode(Product.self, from: data)
                self?.view?.refreshView(productModel: responseModel)
            } catch {
                Logger.log(error.localizedDescription)
            }
        } failure: { error in
            Logger.log(error?.localizedDescription ?? "Error !")
        }
    }
}

