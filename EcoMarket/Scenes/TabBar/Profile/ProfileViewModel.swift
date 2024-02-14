//
//  ProfileViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 14/02/2024.
//

import Foundation

class ProfileViewModel {
    let sectionsOfModels: [ProfileSection] = JSONDecoder().decode(forResource: "Profile") ?? []
    
    let sectionLayoutFactory: ProfileSectionLayoutFactory
    let coordinator: ProfileCoordinatorProtocol
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
        self.sectionLayoutFactory = ProfileSectionLayoutFactory(coordinator: coordinator)
    }
    
    func getSectionLayouts() -> [any SectionsLayout] {
        sectionsOfModels.map { profileSection in
            sectionLayoutFactory.makeSection(from: profileSection)
        }
    }
}
