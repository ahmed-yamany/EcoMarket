//
//  HomeViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

class HomeViewModel {
    let homeModel: HomeModel? = JSONDecoder().decode(forResource: "Home2")
    let factory = HomeFactory()
    
    func getSections() -> [any SectionsLayout] {
        guard let sections = homeModel?.sections else {
            return []
        }
        
        return sections.map {factory.createSection(section: $0)}
    }
}
