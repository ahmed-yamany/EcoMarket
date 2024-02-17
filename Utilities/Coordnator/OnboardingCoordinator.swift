//
//  OnboardingCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 12/02/2024.
//

import UIKit

protocol OnboardingCoordinatorProtocol: Coordinator {
    func showLaunchScreen()
    func showOnboarding()
    func showAuthFlow()
}

class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    var router: Router
        
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showOnboarding()
    }
    
    func showLaunchScreen() {
        let viewController = LaunchViewController()
        router.push(viewController)
    }
    
    func showOnboarding() {
        let viewModel = OnboardingViewModel(coordinator: self)
        let viewController = OnboardingViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showAuthFlow() {
        AppCoordinator.shared.showAuth()
    }
}
