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
}

final class MainViewModel: MainViewModelProtocol {

    // MARK: Definitions
    private let repository: MainRepositoryProtocol
    private let coordinator: MainCoordinatorProtocol
    weak var view: MainViewProtocol?
    
    // MARK: Private Props

    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: MainRepositoryProtocol, coordinator: MainCoordinatorProtocol ) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

