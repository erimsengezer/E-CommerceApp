//
//  ProductListCollectionViewDelegate.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit

protocol ProductListCollectionViewDelegateOutput: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

class ProductListCollectionViewDelegate: NSObject {
    // MARK: - Public Properties
       weak var output: ProductListCollectionViewDelegateOutput?
}

extension ProductListCollectionViewDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.didSelectItem(at: indexPath)
    }
}

extension ProductListCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ProductListCollectionViewSizeCalculator(width: collectionView.frame.width / 2 - 16).itemSize
    }
}
