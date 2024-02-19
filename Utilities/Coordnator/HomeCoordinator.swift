//
//  HomeCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

protocol HomeCoordinatorProtocol: Coordinator {
    func showDetails()
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {}
    
    func showDetails() {
        let viewController = ProductDetailsViewController(product: Product.mockData)
        router.push(viewController)
    }
}
