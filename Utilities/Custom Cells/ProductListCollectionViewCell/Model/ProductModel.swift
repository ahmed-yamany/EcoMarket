//
//  ProductModel.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 24/01/2024.
//

import Foundation

struct ProductModel: Codable {
    let image: String
    let name: String
    let description: String
    let price: String
    
    static let samples: [ProductModel] = [
        .init(image: "image 90", name: "The Marc Jacobs", description: "Bubble Elastic T-shirt", price: "$195.00"),
        .init(image: "image", name: "Axel Arigato", description: "Clean 90 Triple Sneakers", price: "$245.00"),
        .init(image: "image 90", name: "The Marc Jacobs", description: "Bubble Elastic T-shirt", price: "$195.00")
    ]
}
