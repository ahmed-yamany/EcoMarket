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
}

protocol CartCoordinatorProtocol: Coordinator {
    func showCart()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol, CartCoordinatorProtocol {
    
    let viewModel: EMTabBarViewModelInterface = EMTabBarViewModel.shared
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
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
        let vcc = UIViewController()
        vcc.view.backgroundColor = .blue
        return vcc
    }
    
    private func cartViewController() -> UIViewController {
        return CartViewController(coordinator: self)
    }
    
    private func notificationViewController() -> UIViewController {
        let vcc = NotificationCollectionViewController()
        return vcc
    }
    
    private func profileViewController() -> UIViewController {
        let coordinator = ProfileCoordinator(router: router)
        coordinator.start()
        let viewModel = ProfileViewModel(coordinator: coordinator)
        return ProfileViewController(viewModel: viewModel)
    }
}
