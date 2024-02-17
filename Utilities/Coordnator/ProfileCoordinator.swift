//
//  ProfileCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 14/02/2024.
//

import UIKit

protocol ProfileCoordinatorProtocol: Coordinator {
    func showPersonalDetails()
    func showOrder()
    func showFavourites()
    func showShippingAddress()
    func showCard()
    func showSettings()
    func showFAQ()
    func showPrivacyPolicy()
    func showCommunity()
}

class ProfileCoordinator: ProfileCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {}
    
    func showPersonalDetails() {
        print("show personal detail")
    }
    
    func showOrder() {
        print("show order")
    }
    
    func showFavourites() {
        print("show favaoritedd")
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
}
