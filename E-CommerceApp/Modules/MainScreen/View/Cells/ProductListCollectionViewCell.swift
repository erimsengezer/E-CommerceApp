//
//  ProductListCollectionViewCell.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit
import Kingfisher

class ProductListCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier: String = "ProductListCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(productModel: Product) {
        
        let url = URL(string: productModel.image)
        imageView.kf.setImage(with: url)
        
        titleLabel.text = productModel.title
        descriptionLabel.text = productModel.description
        priceLabel.text = "\(productModel.price)$"
    }
}
