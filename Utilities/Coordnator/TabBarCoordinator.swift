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

    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewControler = EMTabBarViewController()
        router.push(viewControler)
    }
    
    func showHome() {
    
    }
    
    func showCart() {
        
    }
    
    func showNotifications() {
        
    }
    
    func showProfile() {
        
    }
    
}
