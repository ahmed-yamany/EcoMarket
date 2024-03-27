//
//  AddAddressViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import Foundation

class AddAddressViewModel {
    var coordinator: ShippingCoordinator
    
    init(coordinator: ShippingCoordinator) {
        self.coordinator = coordinator
    }
    
    func didTapAdd() {
        coordinator.dismiss()
    }
    
    func showAlert() {
        coordinator.showAlert(item: AlertItem(message: L10n.Address.alerMessage, buttonTitle: "OK", image: .warning, status: .warning))
    }
}
