//
//  HomeCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
    func showDetails(product: ProductDetails)
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showHome()
    }
    
    func showHome() {
        let repository = HomeRepository()
        let useCase = HomeThem2UseCase(repository: repository)
        let viewModel = HomeViewModel(coordinator: self, useCase: useCase)
        let vcc = Home2ViewController(viewModel: viewModel)
        router.push(vcc)
    }
    
    func showDetails(product: ProductDetails) {
        let viewController = ProductDetailsViewController(product: product)
        router.push(viewController)
    }
}
