//
//  FeaturesModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import Foundation

struct FeaturesModel: Codable {
    let image: String
    let brandName: String
    let productName: String
    let productPrice: String
}

extension FeaturesModel {
    static let mockData: [FeaturesModel] = [
        .init(image: "hometheme2/image-5", brandName: "Roller Rabbit", productName: "Vado Odelle Dress.", productPrice: "$245.00")
    ]
}
