//
//  ProductDetailRepository.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol ProductDetailRepositoryProtocol: AnyObject {
    func getProduct(success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void)
}

final class ProductDetailRepository: ProductDetailRepositoryProtocol {
    // MARK - Private Properties
    private var id: Int
    
    // MARK: - Initilaizer
    init(id: Int) {
        self.id = id
    }
    
    func getProduct(success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        NetworkManager.shared.getProduct(id: id) { data in
            success(data)
        } failure: { error in
            failure(error)
        }
    }
}
