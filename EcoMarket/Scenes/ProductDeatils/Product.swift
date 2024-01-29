//
//  ProductModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/01/2024.
//

import UIKit

struct Product: Codable {
    let image: String
    let name: String
    let brand: String
    let descriptionTitle: String
    let description: String
    let sizeTitle: String
    
    var uiImage: UIImage? {
        UIImage(named: image)
    }
}

extension Product {
    // swiftlint: disable all
    static let mockData: Product = .init(image: "product",
                                              name: "Herschel Supply Co.",
                                              brand: "Daypack Backpack",
                                              descriptionTitle: "Description",
                                              description: "A roomy backpack from the specialists in everyday bags at Herschel Supply Co., featuring resilient canvas and a light-blue patina that feels just right for summer.",
                                              sizeTitle: "Size")
    // swiftlint: enable all
}
