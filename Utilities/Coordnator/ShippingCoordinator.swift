//
//  ShippingCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

protocol ShippingCoordinatorProtocol: Coordinator {
    func showShipping()
}

class ShippingCoordinator: ShippingCoordinatorProtocol {
    
    var router: Router
    var tabBarCoordinator: TabBarCoordinatorProtocol
    
    init(router: Router, tabBarCoordinator: TabBarCoordinatorProtocol) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showShipping()
    }
    
    func showShipping() {
        let viewModel = ShippingViewModel()
        let viewController = ShippingViewController(viewModel: viewModel)
        router.push(viewController)
    }
}
