//
//  UIViewController+Extensions.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import Foundation

import UIKit

extension UIViewController {

    var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func presentViewController(_ viewControllerToPresent: UIViewController) {
        self.present(viewControllerToPresent, animated: true, completion: nil)
    }

    func pushViewControllerToNavigationController(_ viewControllerToPresent: UIViewController, isAnimated: Bool = true) {
        self.navigationController?.pushViewController(viewControllerToPresent, animated: isAnimated)
    }

    func selfDismiss() {
        self.dismiss(animated: true, completion: nil)
    }

    func selfPopViewController(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }

    func selfPopToRootViewController(animated: Bool = false) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
}
