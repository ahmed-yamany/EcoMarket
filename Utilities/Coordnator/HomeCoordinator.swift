//
//  HomeCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
    func showDetails(product: Product)
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
        let productUseCase = ProductUseCase()
        let viewModel = HomeViewModel(coordinator: self, productUseCase: productUseCase)
        let vcc = Home2ViewController(viewModel: viewModel)
        router.push(vcc)
    }
    
    func showDetails(product: Product) {
        let viewController = ProductDetailsViewController(product: product)
        router.push(viewController)
    }
}
