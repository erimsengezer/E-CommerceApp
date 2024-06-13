//
//  Coordinator.swift
//  Gymi
//
//  Created by erimsengezer on 26.04.2024.
//

import UIKit
import CoreData

typealias DefaultDismissCallback = (() -> Void)

// MARK: Coordinator
protocol Coordinator: AnyObject {
    
    var willDismissCallback: DefaultDismissCallback? { get set }
    var didDismissCallback: DefaultDismissCallback? { get set }

    func start()

}

extension Coordinator {

    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}


// MARK: RootableCoordinator
class RootableCoordinator: NSObject, Coordinator {

    internal var willDismissCallback: DefaultDismissCallback?
    internal var didDismissCallback: DefaultDismissCallback?

    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    deinit {
        Logger.log("killed: \(type(of: self))")
    }

    func start() {
        fatalError("Start method should be implemented.")
    }
}

// MARK: PresentationCoordinator
class PresentationCoordinator: NSObject, Coordinator {

    deinit {
        Logger.log("killed: \(type(of: self))")
    }

    internal var willDismissCallback: DefaultDismissCallback?
    internal var didDismissCallback: DefaultDismissCallback?

    weak var presenterViewController: UIViewController?

    init(presenterViewController: UIViewController?) {
        self.presenterViewController = presenterViewController
    }

    func start() {
        fatalError("Start method should be implemented.")
    }

    func startPresent(targetVC: UIViewController) {
        presenterViewController?.presentViewController(targetVC)
    }
}

// MARK: NavigationCoordinator
class NavigationCoordinator: NSObject, Coordinator {

    deinit {
        Logger.log("killed: \(type(of: self))")
    }
    
    internal var willDismissCallback: DefaultDismissCallback?
    internal var didDismissCallback: DefaultDismissCallback?

    internal let navigationController: UINavigationController
    internal var lastViewController: UIViewController? {
        return self.navigationController.lastViewController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        fatalError("Start method should be implemented.")
    }

}
