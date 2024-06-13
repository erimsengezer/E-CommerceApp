//
//  MainRepository.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MainRepositoryProtocol: AnyObject {
    func getAllProducts(success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void)
}

final class MainRepository: MainRepositoryProtocol {
    func getAllProducts(success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        NetworkManager.shared.getAllProducts { data in
            success(data)
        } failure: { error in
            failure(error)
        }
    }
}
