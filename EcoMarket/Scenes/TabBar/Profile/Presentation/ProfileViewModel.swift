//
//  ProfileViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 14/02/2024.
//

import Foundation

class ProfileViewModel {
    
    let coordinator: ProfileCoordinatorProtocol
    let useCase: ProfileUseCaseProtocol
    
    init(
        coordinator: ProfileCoordinatorProtocol,
        useCase: ProfileUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func getSectionLayouts() async throws -> [any SectionsLayout] {
        try await useCase.getSectionLayouts()
    }
}
