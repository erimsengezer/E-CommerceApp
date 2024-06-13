//
//  ProductDetailViewController.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import UIKit

protocol ProductDetailViewProtocol: AnyObject {
    var viewModel: ProductDetailViewModelProtocol { get }
    func refreshView(productModel: Product)
}

final class ProductDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public Properties
    let viewModel: ProductDetailViewModelProtocol

    // MARK: Constants
    
    // MARK: - Initializers
    init(viewModel: ProductDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func refreshView(productModel: Product) {
        let url = URL(string: productModel.image)
        self.imageView.kf.setImage(with: url)
        
        self.titleLabel.text = productModel.title
        self.descriptionLabel.text = productModel.description
    }
}
