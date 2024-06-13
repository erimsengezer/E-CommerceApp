//
//  ProductListCollectionViewSizeCalculator.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit

struct ProductListCollectionViewSizeCalculator {
    
    // MARK: - Constants
    enum Constants {
        enum Size {
            static let itemHeight: CGFloat = 280
            
        }
    }
    
    // MARK: - Private Properties
    private var width: CGFloat
    
    // MARK: - Public Properties
    var itemSize: CGSize {
        return CGSize(width: width, height: Constants.Size.itemHeight)
    }
    
    // MARK: - Initializer
    init(width: CGFloat) {
        self.width = width
    }
}

