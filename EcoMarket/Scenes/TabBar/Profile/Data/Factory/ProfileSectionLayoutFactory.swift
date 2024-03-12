//
//  ProfileSectionLayoutFactory.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 15/02/2024.
//

import Foundation

class ProfileSectionLayoutFactory {
    let coordinator: ProfileCoordinatorProtocol
    let profileItemFactory: ProfileItemFactory
    
    init(coordinator: ProfileCoordinatorProtocol) {
        self.coordinator = coordinator
        profileItemFactory = ProfileItemFactory(coordinator: coordinator)
    }
    
    func makeSection(from section: ProfileSection) -> any SectionsLayout {
        let collectionSection = ProfileCollectionSection()
        collectionSection.headerTitle = section.title
        let items = section.models.map { profileModel in
            
            self.profileItemFactory.makeItem(from: profileModel)
        }
        
        collectionSection.items = items
        return collectionSection
    }
}
