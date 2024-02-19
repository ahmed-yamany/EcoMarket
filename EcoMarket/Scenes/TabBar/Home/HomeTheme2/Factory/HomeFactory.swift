//
//  HomeFactory.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import Foundation

class HomeFactory {
    func createSection(section: HomeType) -> any SectionsLayout {
        switch section {
            case .features(let item):
                return FeaturesSection(items: item)
            case .categories(let items):
                return CategoriesSection(items: items)
            case .top(let items):
                return TopSection(items: items)
        }
    }
}
