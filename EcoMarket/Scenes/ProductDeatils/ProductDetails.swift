//
//  ProductModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/01/2024.
//

import UIKit

struct ProductDetails: Codable, Identifiable {
    var id: String
    let image: String
    let name: String
    let brand: String
    let descriptionTitle: String
    let description: String
    let sizeTitle: String
    
    let sizes: [String]
    let colors: [String]
    
    var uiImage: UIImage? {
        UIImage(named: image)
    }
    
    var uiColors: [UIColor?] {
        colors.map { UIColor(hexString: $0) }
    }
}
