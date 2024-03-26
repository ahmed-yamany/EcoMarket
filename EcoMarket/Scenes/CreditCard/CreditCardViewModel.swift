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
    
    func isValidExpirationDate(_ date: String) -> Bool {
        let components = date.components(separatedBy: "/")
        guard components.count == 2 else { return false }
        guard let month = Int(components[0]), let year = Int(components[1]) else { return false }
        // Check if month is within range 1-12 and year is in the future
        let currentYear = Calendar.current.component(.year, from: Date()) % 100
        return (1...12).contains(month) && year >= currentYear
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
