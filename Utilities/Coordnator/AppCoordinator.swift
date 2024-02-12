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
}

class AppCoordinator: AppCoordinatorProtocol {
    var window: UIWindow?
    var isLogin = true
    
    static let shared = AppCoordinator()
    
    var router: Router
    init() {
        router = AppRouter(navigationController: .init())
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
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func showOnboarding() {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let coordinator = OnboardingCoordinator(router: router)
        coordinator.start()
        self.present(navigationController)
    }
    
    func showTabBar() {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let coordinator = TabBarCoordinator(router: router)
        coordinator.start()
        self.present(navigationController)
    }
    
    private func present(_ viewController: UIViewController) {
        guard let window else {
            Logger.log("App Router Window is nil", category: \.default, level: .fault)
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
