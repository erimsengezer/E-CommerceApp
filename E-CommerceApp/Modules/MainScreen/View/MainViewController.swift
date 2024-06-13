//
//  MainViewController.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    var viewModel: MainViewModelProtocol { get }
    
    func configureCollectionView()
    func refresh(with responseModel: ProductsModel)
    func configureNavBar()
}

final class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Public Properties
    let viewModel: MainViewModelProtocol
    var collectionViewDelegate: ProductListCollectionViewDelegate?
    var collectionViewDataSource: ProductListCollectionViewDataSource?
    // MARK: Constants
    
    // MARK: - Initializers
    init(viewModel: MainViewModelProtocol) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
}

extension MainViewController: MainViewProtocol {
    func configureNavBar() {
        self.title = "Product List"
    }
    
    func configureCollectionView() {
        let nib = UINib(nibName: "ProductListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ProductListCollectionViewCell.cellIdentifier)
        
        self.collectionViewDelegate = ProductListCollectionViewDelegate()
        self.collectionViewDataSource = ProductListCollectionViewDataSource()
        
        collectionView.delegate = self.collectionViewDelegate
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.reloadData()
        
        self.collectionViewDelegate?.output = self
    }
    
    func refresh(with responseModel: ProductsModel) {
        collectionViewDataSource?.update(responseModel: responseModel)
        collectionView.reloadData()
    }
}

extension MainViewController: ProductListCollectionViewDelegateOutput {
    func didSelectItem(at indexPath: IndexPath) {
        viewModel.coordinateToProductDetail(id: indexPath.row)
    }
}
