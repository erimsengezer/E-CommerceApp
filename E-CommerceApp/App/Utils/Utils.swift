//
//  Utils.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import UIKit

class Utils {
    static let shared: Utils = Utils()
    
    private var applicationDelegate: UIApplicationDelegate? {
        return UIApplication.shared.delegate
    }
    
    var appDelegate: AppDelegate {
        if let appDelegate = applicationDelegate as? AppDelegate {
            return appDelegate
        } else {
            return AppDelegate()
        }
    }
}
