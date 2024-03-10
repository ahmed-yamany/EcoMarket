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
        let viewModel = ProductDetailViewModel(product: product, productDetailUseCase: ProductDetailUseCase(), coordinator: self)
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showAlert(item: AlertItem) {
        router.showAlert(item: item)
    }
}
