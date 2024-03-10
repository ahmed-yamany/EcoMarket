//
//  Product.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import UIKit

struct Product: Identifiable, Equatable {
    let id: String
    let name: String
    let brandName: String
    let price: Double
    let discountPercentage: Double
    let image: UIImage?
    let category: String
    static let mockData = Product(id: "1",
                                  name: "test",
                                  brandName: "brandName",
                                  price: 44,
                                  discountPercentage: 32,
                                  image: UIImage(named: "cart/image1"),
                                  category: "")
    
}

extension Array where Element == ProductSource {
    
    func toProducts() -> [Product] {
            return self.map { source in
                Product(
                    id: source.id,
                    name: source.name,
                    brandName: source.brandName,
                    price: source.price,
                    discountPercentage: source.discountPercentage,
                    image: UIImage(named: source.image ),
                    category: source.category
                )
            }
        }
}
