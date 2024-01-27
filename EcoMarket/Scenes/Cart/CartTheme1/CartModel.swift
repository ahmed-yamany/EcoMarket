//
//  CartModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import Foundation

struct CartModel {
    let name: String
    let brand: String
    let price: String
    let image: String
    
    static var products: [CartModel] = [
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image"),
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image"),
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image")
    ]
}
