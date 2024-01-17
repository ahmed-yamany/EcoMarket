//
//  NavigationRouter.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit

public class NavigationRouter: Router {
    public var parentViewController: UIViewController?
    let navigationController: UINavigationController
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.parentViewController = navigationController
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popViewController(animated: animated)
    }
}
