//
//  HomeModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 19/02/2024.
//

import Foundation

struct HomeModel: Codable {
    let sections: [HomeType]
}

enum HomeType: Codable {
    case features(items: [FeaturesModel])
    case categories(items: [CategoriesModel])
    case top(items: [TopProductModel])
}