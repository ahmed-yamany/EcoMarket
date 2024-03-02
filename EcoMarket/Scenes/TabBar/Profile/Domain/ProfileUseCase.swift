//
//  ProfileUseCase.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 28/02/2024.
//

import Foundation

protocol ProfileUseCaseProtocol {
    func getSectionLayouts() async throws -> [any SectionsLayout]
}

final class ProfileUseCase: ProfileUseCaseProtocol {
    var sectionsOfModels: [ProfileSection]?
    let sectionLayoutFactory: ProfileSectionLayoutFactory

    init(sectionLayoutFactory: ProfileSectionLayoutFactory) {
        self.sectionLayoutFactory = sectionLayoutFactory
    }
    
    func getSectionLayouts() async throws -> [any SectionsLayout] {
        if let sections = sectionsOfModels {
            return buildSection(from: sections)
        } else {
            let sections: [ProfileSection] = JSONDecoder().decode(forResource: "Profile") ?? []
            self.sectionsOfModels = sections
            return buildSection(from: sections)
        }
    }
    
    private func buildSection(from sections: [ProfileSection]) -> [any SectionsLayout] {
        sections.map { profileSection in
            sectionLayoutFactory.makeSection(from: profileSection)
        }
    }
    
}
