//
//  CreditCardCoordinator.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import Foundation

protocol CreditCardCoordinatorProtocol: Coordinator {
    func showCreditCard()
    func showAlert(item: AlertItem)
}

final class CreditCardCoordinator: CreditCardCoordinatorProtocol {
    
    var router: any Router
    var tabBarCoordinator: TabBarCoordinatorProtocol
    
    init(router: any Router, tabBarCoordinator: TabBarCoordinatorProtocol) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showCreditCard()
    }
    
    func showCreditCard() {
        let viewModel = CreditCardViewModel(coordinator: self)
        let viewController = CreditCardViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showAlert(item: AlertItem) {
        DispatchQueue.main.async {
            self.router.showAlert(item: item)
        }
    }
}
