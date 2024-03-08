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
    func showTabBar()
    func hideTabBar()
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    var router: Router
    var tabBarCoordinator: TabBarCoordinatorProtocol
    
    init(router: Router, tabBarCoordinator: TabBarCoordinatorProtocol) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showHome()
    }
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabBar() {
        tabBarCoordinator.hideTabBar()
    }
    
    func showHome() {
        let useCase = HomeUseCase()
        let viewModel = HomeViewModel(coordinator: self, useCase: useCase)
        let vcc = Home2ViewController(viewModel: viewModel)
        router.push(vcc)
    }
    
    func showDetails(product: Product) {
        let viewModel = ProductDetailViewModel(product: product, productDetailUseCase: ProductDetailUseCase())
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        router.push(viewController)
    }
}
