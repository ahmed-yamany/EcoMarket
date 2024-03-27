//
//  AppRouter.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit

public final class AppRouter {
    public let navigationController: UINavigationController
    public let alertInterface: AlertInterface & UIViewController
    
    public required init(navigationController: UINavigationController, alertInterface: AlertInterface & UIViewController) {
        self.navigationController = navigationController
        self.alertInterface = alertInterface
        navigationController.navigationBar.tintColor = .black
        navigationController
            .navigationBar
            .titleTextAttributes = [.font: UIFont.h2, NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.backIndicatorImage = AppImage.Icon.back?.withRenderingMode(.alwaysOriginal)
        navigationController
            .navigationBar
            .backIndicatorTransitionMaskImage = AppImage.Icon.back?.withRenderingMode(.alwaysOriginal)
    }
}

extension AppRouter: Router {
    public func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentFullScreen(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentOverFullScreen(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        if navigationController.presentedViewController != nil {
            navigationController.dismiss(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
            completion()
        }
    }
    
    public func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: false)
        navigationController.pushViewController(viewController, animated: animated)
        completion()
    }
    
    public func reset(completion: @escaping () -> Void) {
        navigationController.dismiss(animated: false)
        navigationController.viewControllers.removeAll()
    }
    
    public func popToViewController(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        navigationController.popToViewController(viewController, animated: animated)
        completion()
    }
    
    public func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToRootViewController(animated: animated)
        completion()
    }
    
    func showAlert(item: AlertItem, completion: @escaping () -> Void) {
        alertInterface.modalTransitionStyle = .crossDissolve
        self.presentOverFullScreen(alertInterface, completion: completion)
        alertInterface.show(item: item)
    }
}
