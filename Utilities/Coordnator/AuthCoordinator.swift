//
//  AuthCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 12/02/2024.
//

import UIKit

protocol AuthCoordinatorProtocol: Coordinator {
    func showSplash()
    func showLogin()
    func showSignup()
    func showSuccessScreen()
    func showTabBar()
}

class AuthCoordinator: AuthCoordinatorProtocol {
    
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showSplash()
    }
    
    func showSplash() {
        let viewController = SplashViewController(coordinator: self)
        router.push(viewController)
    }
    
    func showLogin() {
        let viewModel = LoginViewModel(coordinator: self)
        let viewController = LoginViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showSignup() {
        let viewController = SignupViewController()
        router.push(viewController)
    }
    
    func showSuccessScreen() {
        let viewController = SuccessViewController(coordinator: self)
        router.presentFullScreen(viewController)
    }
    
    func showTabBar() {
        AppCoordinator.shared.showTabBar()
    }
}
