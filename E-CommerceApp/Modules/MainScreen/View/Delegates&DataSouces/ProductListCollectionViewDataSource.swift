//
//  ProductListCollectionViewDataSource.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit

class ProductListCollectionViewDataSource: NSObject {
    // MARK: - Private Properties
    private var responseModel: ProductsModel?
    
    func update(responseModel: ProductsModel) {
        self.responseModel = responseModel
    }
}

extension ProductListCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return responseModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.cellIdentifier, 
                                                            for: indexPath) as? ProductListCollectionViewCell else { return UICollectionViewCell() }
        guard let model = responseModel else { return UICollectionViewCell() }
        
        cell.configureCell(productModel: model[indexPath.row])
        return cell
    } 
}
