//
//  ShippingViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/03/2024.
//

import Foundation

class ShippingViewModel {
    @Published var address: [Address] = []
    
    var coordinator: ShippingCoordinatorProtocol
    
    init(coordinator: ShippingCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func goToAddAddress() {
        coordinator.showAddAddress(delegate: self)
    }
    
    func didTapPayment() {
        if address.isEmpty {
            coordinator.showAlert(item: AlertItem(message: L10n.Shipping.alerMessage, 
                                                  buttonTitle: "OK",
                                                  image: .warning,
                                                  status: .warning))
        } else {
            coordinator.showCredit()
        }
    }
}

extension ShippingViewModel: AddAddressViewControllerDelegate {
    func addingAddress(_ address: [Address]) {
        self.address += address
    }
}
