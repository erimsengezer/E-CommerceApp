//
//  LoginViewModel.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    
    func login(loginModel: LoginModel)
}

final class LoginViewModel: LoginViewModelProtocol {

    // MARK: Definitions
    private let repository: LoginRepositoryProtocol
    private let coordinator: LoginCoordinatorProtocol
    weak var view: LoginViewProtocol?
    
    // MARK: Private Props

    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: LoginRepositoryProtocol, coordinator: LoginCoordinatorProtocol ) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func login(loginModel: LoginModel) {
        repository.login(loginModel: loginModel) { data in
            Logger.log("Token: \(data.base64EncodedString())")
            Utils.shared.appDelegate.startFlowMain()
        } failure: {
            Logger.log("Error!", level: .error)
            self.view?.showErrorAlert(title: "Error", message: "Login Error !", preferredStyle: .alert)
        }
    }
}

