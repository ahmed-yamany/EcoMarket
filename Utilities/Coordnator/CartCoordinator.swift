//
//  CartCoordinator.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 19/03/2024.
//

import Foundation

protocol CartCoordinatorProtocol: Coordinator {
}

final class CartCoordinator: CartCoordinatorProtocol {
    var router: any Router

    init(router: any Router) {
        self.router = router
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

}
