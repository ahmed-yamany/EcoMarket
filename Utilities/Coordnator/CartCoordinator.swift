//
//  CartCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/03/2024.
//

import Foundation

protocol CartCoordinatorProtocol: Coordinator {
    func showShipping()
    func showTabBar()
    func hideTabBar()
    func showAlert(item: AlertItem)
}

final class CartCoordinator: CartCoordinatorProtocol {
    
    var router: any Router
    var tabBarCoordinator: TabBarCoordinatorProtocol

    init(router: any Router, tabBarCoordinator: TabBarCoordinatorProtocol) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        let useCase = EMTabBarViewModel.shared
        let productUseCase = ProductUseCase()
        let viewModel = CartViewModel(
            cartUseCase: useCase,
            coordinator: self,
            productUseCase: productUseCase
        )
        let controller = CartViewController(viewModel: viewModel)
        router.push(controller)
    }

    func showShipping() {
        let coordinator = ShippingCoordinator(router: router, tabBarCoordinator: tabBarCoordinator)
        coordinator.start()
    }
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabBar() {
        tabBarCoordinator.hideTabBar()
    }
    
    func showAlert(item: AlertItem) {
        DispatchQueue.main.async {
            self.router.showAlert(item: item)
        }
    }
}
