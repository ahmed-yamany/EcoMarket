//
//  SectionsModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 13/02/2024.
//

import Foundation

struct SectionsModel: Codable {
    let type: SectionsType
    var products: [CartModel]?
    var promo: [String]?
    var checkOut: [String]?
}

extension SectionsModel {
    static let mockData: [SectionsModel] = [
        SectionsModel(type: .product, products: CartModel.products),
        SectionsModel(type: .promoCode, promo: [""]),
        SectionsModel(type: .checkOut, checkOut: [""])
    ]
}
