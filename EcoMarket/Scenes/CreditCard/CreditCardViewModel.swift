//
//  CreditCardViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit
import Combine

class CreditCardViewModel {
    
    var coordinator: ProfileCoordinatorProtocol
    
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func formatExpirationDate(_ input: String) -> String {
        var input = isValidTextField(value: input, 4)
        input.replace(by: "/", after: 2)
        return input
    }
    
    func isValidTextField(value: String, _ byPrefix: Int) -> String {
        let cleanedValue = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        return String(cleanedValue.prefix(byPrefix))
    }
    
    func didTapAddCard() {
        coordinator.showAlert(item: .init(message: L10n.Credit.success, buttonTitle: "Ok", image: .success, status: .success))
    }
    
    func didTapCancel() {
        coordinator.dismiss()
    }
}
