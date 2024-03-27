//
//  ShippingCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import UIKit

protocol ShippingCoordinatorProtocol: Coordinator {
    func showShipping()
    func showAddAddress(delegate: AddAddressViewControllerDelegate)
    func showCredit()
    func showAlert(item: AlertItem)
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
        let viewModel = ShippingViewModel(coordinator: self)
        let viewController = ShippingViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showAddAddress(delegate: AddAddressViewControllerDelegate) {
        let viewModel = AddAddressViewModel(coordinator: self)
        let viewController = AddAddressViewController(viewModel: viewModel)
        viewController.delegate = delegate
        router.push(viewController)
    }
    
    func showCredit() {
        let coordinator = CreditCardCoordinator(router: router, tabBarCoordinator: tabBarCoordinator)
        coordinator.start()
    }
    
    func showAlert(item: AlertItem) {
        DispatchQueue.main.async {
            self.router.showAlert(item: item)
        }
    }
}
