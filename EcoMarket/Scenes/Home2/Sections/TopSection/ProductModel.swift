//
//  ProductModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import Foundation

struct ProductModel: Codable {
    
    // MARK: - Properties
    let name: String
    let brand: String
    let price: String
    let image: String
}

extension ProductModel {
    static var mockData: [ProductModel] = [
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "hometheme2/image-5"),
         .init(name: "Giselle Top in White Linen", brand: "Madewell", price: "$108.00", image: "hometheme2/image-4"),
         .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$96.00", image: "hometheme2/image-3"),
         .init(name: "Irregular Rib Skirt", brand: "Madewell", price: "$78.00", image: "hometheme2/image-2"),
         .init(name: "Bubble Elastic T-shirt", brand: "Roller Rabbit", price: "$39.00", image: "hometheme2/image-5"),
         .init(name: "Vado Odelle Dress", brand: "Madewell", price: "$98.00", image: "hometheme2/image")
    ]
}