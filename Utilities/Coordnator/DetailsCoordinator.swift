//
//  DetailsCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/03/2024.
//

import Foundation

protocol DetailsCoordinatorProtocol: Coordinator {
    func showDetails(product: Product)
    func showAlert(item: AlertItem)
}

class DetailsCoordinator: DetailsCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {}
    
    func showDetails(product: Product) {
        let cartUseCase = EMTabBarViewModel.shared
        let productDetailUseCase = ProductDetailUseCase(cartUseCase: cartUseCase)
        let viewModel = ProductDetailViewModel(
            product: product,
            productDetailUseCase: productDetailUseCase,
            coordinator: self
        )
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showAlert(item: AlertItem) {
        DispatchQueue.main.async {
            self.router.showAlert(item: item)
        }
    }
}
