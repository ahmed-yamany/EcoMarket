//
//  CartModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import Foundation

struct CartModel: Equatable, Codable {
    let id = UUID()
    let name: String
    let brand: String
    let price: String
    let image: String
    
    static var products: [CartModel] = [
        .init(name: "Vado Odell Dress", brand: "Roller Rabbit", price: "$198.00", image: "cart/image1"),
        .init(name: "Clean 90 Triole Sneakers", brand: "Axel Arigato", price: "$245.00", image: "cart/image2"),
        .init(name: "Daypack Backpack", brand: "Herschel Supply Co.", price: "$40.00", image: "cart/image3")
    ]
}
