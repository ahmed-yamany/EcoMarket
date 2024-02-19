//
//  HomeFactory.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import Foundation

class HomeFactory {
    let delegate: HomeSectionsDelegate
    init(delegate: HomeSectionsDelegate) {
        self.delegate = delegate
    }
    
    func createSection(section: HomeType) -> any SectionsLayout {
        switch section {
            case .features(let item):
                return FeaturesSection(items: item, delegate: delegate)
            case .categories(let items):
                return CategoriesSection(items: items, delegate: delegate)
            case .top(let items):
                return TopSection(items: items, delegate: delegate)
        }
    }
}
