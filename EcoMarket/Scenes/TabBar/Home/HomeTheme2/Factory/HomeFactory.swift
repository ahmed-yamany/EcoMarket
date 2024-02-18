//
//  HomeFactory.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import Foundation

// Enum to represent the types of sections
enum HomeType: Codable {
    case features
    case categories
    case top
}

// Factory class responsible for creating different sections based on their type
class HomeFactory {
    
    /// Creates a section based on the provided SectionsModel.
        ///
        /// - Parameter section: The SectionsModel containing the type and products for the section.
        /// - Returns: An instance conforming to the SectionsLayout protocol.
    func createSection(section: HomeFactoryModel) -> any SectionsLayout {
        switch section.type {
            case .features:
                return FeaturesSection(items: FeaturesModel.mockData)
            case .categories:
                return CategoriesSection(items: CategoriesModel.mockData)
            case .top:
                return TopSection(items: TopProductModel.mockData)
        }
    }
}
