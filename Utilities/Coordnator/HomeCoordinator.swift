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
    func showCategories()
    func showProductsView(category: String)
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
        let coordinator = DetailsCoordinator(router: router)
        coordinator.showDetails(product: product)
    }
    
    func showCategories() {
        let productUseCase = ProductUseCase()
        let viewModel = Category2ViewModel(coordinator: self, productUseCase: productUseCase)
        let vcc = CategoryViewController2(viewModel: viewModel)
        router.push(vcc)
    }
    
    func showProductsView(category: String) {
        let productUseCase = ProductUseCase()
        let viewModel = ProductViewModel(coordinator: self, productUseCase: productUseCase, category: category)
        let viewController = ProductsViewController(viewModel: viewModel)
        router.push(viewController)
    }
}
