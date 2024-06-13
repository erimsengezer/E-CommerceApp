//
//  SplashViewController.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    var viewModel: SplashViewModelProtocol { get }
}

final class SplashViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Public Properties
    let viewModel: SplashViewModelProtocol

    // MARK: Constants
    
    // MARK: - Initializers
    init(viewModel: SplashViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.log("SplashViewController --- viewDidLoad")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.viewModel.coordinateToLogin()
        })
    }
}

extension SplashViewController: SplashViewProtocol {
    
}
