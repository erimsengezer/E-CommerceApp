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
}

final class MainViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Public Properties
    let viewModel: MainViewModelProtocol

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
    }
}

extension MainViewController: MainViewProtocol {
    
}
