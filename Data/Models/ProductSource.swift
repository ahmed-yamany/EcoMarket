//
//  ProductSource.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import Foundation

struct ProductSource: Identifiable, Codable {
    let id: String
    let name: String
    let brandName: String
    let price: Double
    let discountPercentage: Double
    let image: String
    let category: String
    
}
