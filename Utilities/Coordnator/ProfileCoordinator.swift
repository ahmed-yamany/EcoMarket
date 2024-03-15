//
//  ProfileCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 14/02/2024.
//

import UIKit

protocol ProfileCoordinatorProtocol: Coordinator {
    func showProfile()
    func showPersonalDetails()
    func showOrder()
    func showFavourites()
    func showShippingAddress()
    func showCard()
    func showSettings()
    func showFAQ()
    func showPrivacyPolicy()
    func showCommunity()
    func showTabBar()
    func hideTabeBar()
}

class ProfileCoordinator: ProfileCoordinatorProtocol {
    
    var router: Router
    let tabBarCoordinator: TabBarCoordinatorProtocol
    
    init(router: Router, tabBarCoordinator: TabBarCoordinatorProtocol) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showProfile()
    }
    
    func showProfile() {
        let factory = ProfileSectionLayoutFactory(coordinator: self)
        let useCase = ProfileUseCase(sectionLayoutFactory: factory)
        let viewModel = ProfileViewModel(coordinator: self, useCase: useCase)
        let viewController = ProfileViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showPersonalDetails() {
        print("show personal detail")
    }
    
    func showOrder() {
        let viewModel = TrackingViewModel()
        let tracking = Tracking.mockData
        let viewController = TrackingViewController(tracking: tracking, viewModel: viewModel)
        router.push(viewController)
    }
    
    func showFavourites() {
        let useCase = EMTabBarViewModel.shared
        let productUseCase = ProductUseCase()
        let viewModel = WishListViewModel(cartUseCase: useCase, productUseCase: productUseCase)
        let viewController = WishListViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showShippingAddress() {
        print("show addreed")
    }
    
    func showCard() {
        print("show art")
    }
    
    func showSettings() {
        let viewModel = SettingsViewModel(coordinator: self)
        let viewController = SettingsViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showFAQ() {
        print("FAQ")
    }
    
    func showPrivacyPolicy() {
        print("Policy")
    }
    
    func showCommunity() {
        print("Community")
    }
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabeBar() {
        tabBarCoordinator.hideTabBar()
    }
}
