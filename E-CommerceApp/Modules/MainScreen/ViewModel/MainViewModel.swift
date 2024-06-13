//
//  MainViewModel.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    
    func viewDidLoad()
    func getAllProducts()
    func viewWillAppear()
    func coordinateToProductDetail(id: Int)
}

final class MainViewModel: MainViewModelProtocol {

    // MARK: Definitions
    private let repository: MainRepositoryProtocol
    private let coordinator: MainCoordinatorProtocol
    weak var view: MainViewProtocol?
    
    // MARK: Private Props
    private var responseModel: ProductsModel?
    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: MainRepositoryProtocol, coordinator: MainCoordinatorProtocol ) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        view?.configureNavBar()
        view?.configureCollectionView()
        getAllProducts()
    }
    
    func viewWillAppear() { }
    
    func getAllProducts() {
        repository.getAllProducts { data in
            do {
                let responseModel = try JSONDecoder().decode(ProductsModel.self, from: data)
                self.responseModel = responseModel
                self.view?.refresh(with: responseModel)
            } catch {
                Logger.log(error.localizedDescription)
            }
        } failure: { error in
            Logger.log(error?.localizedDescription ?? "Error !")
        }

    }
    
    func coordinateToProductDetail(id: Int) {
        guard let model = responseModel?[id] else { return }
        coordinator.coordinateToProductDetail(id: model.id)
    }
}

