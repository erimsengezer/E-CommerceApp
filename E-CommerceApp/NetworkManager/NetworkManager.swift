//
//  NetworkManager.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import Foundation
import Alamofire

enum URLs: String {
    case baseUrl = "https://fakestoreapi.com"
    case login = "/auth/login"
    case products = "/products"
}

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    
    func login(loginModel: LoginModel, success: @escaping (Data) -> Void, failure: @escaping () -> Void) {
        let parameters = [
            "username": loginModel.username,
            "password": loginModel.password
        ]
        
        let url: String = URLs.baseUrl.rawValue + URLs.login.rawValue
        
        AF.request(url, method: .post, parameters: parameters).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { return failure() }
                success(data)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }
    
    func getAllProducts(success: @escaping (Data) -> Void, failure: @escaping (AFError?) -> Void) {
        let url: String = URLs.baseUrl.rawValue + URLs.products.rawValue
        
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { return failure(response.error) }
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getProduct(id: Int, success: @escaping (Data) -> Void, failure: @escaping (AFError?) -> Void) {
        let url: String = URLs.baseUrl.rawValue + URLs.products.rawValue + "/\(id)"
        
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { return failure(response.error) }
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
