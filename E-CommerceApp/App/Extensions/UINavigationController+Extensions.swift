//
//  UINavigationController+Extensions.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit

extension UINavigationController {
    
    var lastViewController: UIViewController? {
        return viewControllers.last
    }
    
    func setRootViewController(viewController: UIViewController) {
        self.viewControllers = [viewController]
    }
}
