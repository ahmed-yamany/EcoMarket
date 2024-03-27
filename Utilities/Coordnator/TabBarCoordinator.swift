//
//  TabBarCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 13/02/2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func showTabBar()
    func hideTabBar()
    func showHome()
    func showCart()
    func showNotifications()
    func showProfile()
    func logout()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    
    let viewModel: EMTabBarViewModelInterface = EMTabBarViewModel.shared
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        router.navigationController.navigationBar.isHidden = true
        viewModel.viewControllers = [
            homeViewController(),
            cartViewController(),
            notificationViewController(),
            profileViewController()
        ]
        let viewControler = EMTabBarViewController(viewModel: viewModel)
        router.push(viewControler)
    }
    
    func showTabBar() {
        self.viewModel.tabBarIsHidden = false
    }
    
    func hideTabBar() {
        viewModel.tabBarIsHidden = true
    }
    
    func showHome() {
        viewModel.selectedTab = .home
    }
    
    func showCart() {
        viewModel.selectedTab = .cart
    }
    
    func showNotifications() {
        viewModel.selectedTab = .notification
    }
    
    func showProfile() {
        viewModel.selectedTab = .profile
    }
    
    private func homeViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let alertInterface = AlertViewController()
        let router = AppRouter(navigationController: navigationController, alertInterface: alertInterface)
        let coordinator = HomeCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
    
    private func cartViewController() -> UIViewController {
        
        let navigationController = UINavigationController()
        let alertInterface = AlertViewController()
        let router = AppRouter(
            navigationController: navigationController,
            alertInterface: alertInterface
        )
        
        let coordinator = CartCoordinator(router: router, tabBarCoordinator: self)
      
        coordinator.start()
        
        return navigationController
    }
    
    private func notificationViewController() -> UIViewController {
        let viewModel = NotificationViewModel(tabBarViewModelInterface: viewModel)
        let vcc = NotificationViewController(viewModel: viewModel)
        return vcc
    }
    
    private func profileViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let alertInterface = AlertViewController()
        let router = AppRouter(navigationController: navigationController, alertInterface: alertInterface)
        let coordinator = ProfileCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
    
    func logout() {
        AppCoordinator.shared.showAuth()
    }
}
