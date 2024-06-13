//
//  LoginViewController.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//  Copyright (c) 2024 All rights reserved.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    var viewModel: LoginViewModelProtocol { get }
    
    func showErrorAlert(title: String, message: String, preferredStyle: UIAlertController.Style)
}

final class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Public Properties
    let viewModel: LoginViewModelProtocol

    // MARK: Constants
    
    // MARK: - Initializers
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.log("LoginViewController")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let username: String = usernameTextField.text,
           let password: String = passwordTextField.text {
            let loginModel = LoginModel(username: username, password: password)
            viewModel.login(loginModel: loginModel)
        }
    }
}

extension LoginViewController: LoginViewProtocol {
    func showErrorAlert(title: String, message: String, preferredStyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let okButton = UIAlertAction(title: "OK !", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
