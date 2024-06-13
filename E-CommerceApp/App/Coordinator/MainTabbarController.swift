//
//  MainTabbarController.swift
//  Gymi
//
//  Created by erimsengezer on 26.04.2024.
//

import UIKit

enum MainTabbarItemPosition: Int {
    case productListScreen = 0
}

enum MainTabbarTitle: String {
    case list = "List"
}

final class MainTabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeTabbarItemController(position: MainTabbarItemPosition) {
        self.selectedIndex = position.rawValue
    }
}
