//
//  Cart2Model.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 29/01/2024.
//

import Foundation

struct Cart2Model {
    let name: String
    let brand: String
    let price: String
    let image: String
    
    static var products: [Cart2Model] = [
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "cart2/image1"),
        .init(name: "Clean 90 Triole Snakers", brand: "Axel Arigato", price: "$245.00", image: "cart2/image2"),
        .init(name: "Daypack Backpack", brand: "Herschel Supply Co.", price: "$40.00", image: "cart2/image3")
    ]
}
