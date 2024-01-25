//
//  ProductModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/01/2024.
//

import UIKit

struct ProductModel {
    let image: UIImage
    let name: String
    let brand: String
    let descriptionTitle: String
    let description: String
    let sizeTitle: String
}

extension ProductModel {
    static let mockData: ProductModel = .init(image: UIImage(named: "product") ?? UIImage(),
                                              name: "Herschel Supply Co.",
                                              brand: "Daypack Backpack",
                                              descriptionTitle: "Description",
                                              description: "A roomy backpack from the specialists in everyday bags at Herschel Supply Co., featuring resilient canvas and a light-blue patina that feels just right for summer.",
                                              sizeTitle: "Size")
}
