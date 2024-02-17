//
//  SectionsModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import Foundation

struct HomeFactoryModel: Codable {
    let type: HomeType
    var features: [FeaturesModel]?
    var categories: [CategoriesModel]?
    var top: [TopProductModel]?
}

extension HomeFactoryModel {
    static let mockData: [HomeFactoryModel] = [
        HomeFactoryModel(type: .features, features: FeaturesModel.mockData),
        HomeFactoryModel(type: .categories, categories: CategoriesModel.mockData),
        HomeFactoryModel(type: .top, top: TopProductModel.mockData)
    ]
}
