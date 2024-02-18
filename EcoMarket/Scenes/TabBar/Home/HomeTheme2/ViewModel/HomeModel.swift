//
//  HomeModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

struct Home: Codable {
    let sections: [HomeSection]
}

struct HomeSection: Codable {
    var features: [FeaturesModel]?
    var categories: [CategoriesModel]?
    var top: [TopProductModel]?
}
