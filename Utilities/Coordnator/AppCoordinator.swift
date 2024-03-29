//
//  AppCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 12/02/2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func makeWindow(from windowScene: UIWindowScene)
    func showTabBar()
    func showOnboarding()
    func showAuth()
}

class AppCoordinator: AppCoordinatorProtocol {
    var window: UIWindow?
    var isLogin = false
    
    static let shared = AppCoordinator()
    
    var router: Router
    init() {
        router = AppRouter(navigationController: .init(), alertInterface: AlertViewController())
    }
    
    func start() {
        if isLogin {
            showTabBar()
        } else {
            showOnboarding()
        }
    }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.window = window
    } 
    
    func showOnboarding() {
        let coordinator = OnboardingCoordinator(router: self.router)
        router.reset()
        coordinator.start()
    }
    
    func showTabBar() {
        let coordinator = TabBarCoordinator(router: self.router)
        router.reset()
        coordinator.start()
    }
    
    func showAuth() {
        let authCoordinator = AuthCoordinator(router: self.router)
        router.reset()
        authCoordinator.start()
    }
}
