//
//  LoginViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 12/02/2024.
//

import Foundation

class LoginViewModel {
    let coordinator: AuthCoordinatorProtocol
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func loginButtonTapped() {
        coordinator.showSuccessScreen()
    }
}
