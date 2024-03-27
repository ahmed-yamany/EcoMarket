//
//  SettingsViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 15/02/2024.
//

import Foundation

class SettingsViewModel {
    let sectionsOfModels: [ProfileSection] = JSONDecoder().decode(forResource: "Settings") ?? []
    let sectionLayoutFactory: ProfileSectionLayoutFactory

    let coordinator: ProfileCoordinatorProtocol
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
        sectionLayoutFactory = ProfileSectionLayoutFactory(coordinator: coordinator)
    }
    
    func getSectionLayouts() -> [any SectionsLayout] {
        sectionsOfModels.map { profileSection in
            sectionLayoutFactory.makeSection(from: profileSection)
        }
    }
    
    func didTapLogOut() {
        coordinator.logout()
    }
}
