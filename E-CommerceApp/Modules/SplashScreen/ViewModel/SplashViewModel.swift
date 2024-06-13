//
//  SplashViewModel.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol SplashViewModelProtocol: AnyObject {
    var view: SplashViewProtocol? { get set }
    
    func coordinateToLogin()
}

final class SplashViewModel: SplashViewModelProtocol {

    // MARK: Definitions
    private let repository: SplashRepositoryProtocol
    private let coordinator: SplashCoordinatorProtocol
    weak var view: SplashViewProtocol?
    
    // MARK: Private Props

    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: SplashRepositoryProtocol, coordinator: SplashCoordinatorProtocol ) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func coordinateToLogin() {
        coordinator.coordinateToLogin()
    }
}

