//
//  CategoriesModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import Foundation

struct CategoriesModel: Codable {
    let name: String
}

extension CategoriesModel {
    static let mockData: [CategoriesModel] = [
        .init(name: "Dresses"),
        .init(name: "Jackets"),
        .init(name: "Jeans"),
        .init(name: "Shoese")
    ]
}
