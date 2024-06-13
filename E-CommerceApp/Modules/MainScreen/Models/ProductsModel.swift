//
//  ProductsModel.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import Foundation

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}

typealias ProductsModel = [Product]
