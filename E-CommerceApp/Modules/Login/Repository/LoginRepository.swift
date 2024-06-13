//
//  LoginRepository.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol LoginRepositoryProtocol: AnyObject {
    func login(loginModel: LoginModel, success: @escaping (Data) -> Void, failure: @escaping () -> Void)
}

final class LoginRepository: LoginRepositoryProtocol {
    func login(loginModel: LoginModel, success: @escaping (Data) -> Void, failure: @escaping () -> Void) {
        NetworkManager.shared.login(loginModel: loginModel) { data in
            success(data)
        } failure: {
            failure()
        }
    }
}
