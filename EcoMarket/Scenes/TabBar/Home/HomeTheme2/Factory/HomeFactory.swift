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
            case .categories(let items, let title):
                return CategoriesSection(items: items, delegate: delegate, headerTitle: title)
            case .top(let items, let title):
                return TopSection(items: items, delegate: delegate, headerTitle: title)
        }
    }
}
