//
//  TabBarCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 13/02/2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func showHome()
    func showCart()
    func showNotifications()
    func showProfile()
}

class TabBarCoordinator: TabBarCoordinatorProtocol {
    
    let viewModel = EMTabBarViewModel.shared
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewControler = EMTabBarViewController(viewModel: viewModel)
        router.push(viewControler)
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
    
}
