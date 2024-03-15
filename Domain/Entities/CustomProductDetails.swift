//
//  CustomProdutDetails.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/03/2024.
//

import UIKit

struct CustomProductDetails: Identifiable, Hashable {
    var id: String { productId }
    let productId: String
    let selectedColor: UIColor
    let selectedSize: ProductSizes
    var count: Int = 0
    var isFavorite: Bool
    var inCart: Bool
}
