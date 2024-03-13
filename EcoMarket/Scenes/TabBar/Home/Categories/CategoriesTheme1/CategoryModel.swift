//
//  CategoryModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import Foundation

// `CategoryModel` represents a data model for a product category.
struct CategoryModel {
    let image: String
    let name: String
    let productNumber: String
}

extension CategoryModel {
    static let mockData1 = [
        CategoryModel(image: "category/icon", name: "New Arrivals", productNumber: "208 Product"),
        CategoryModel(image: "category/icon-2", name: "Clothes", productNumber: "200 Product"),
        CategoryModel(image: "category/icon-3", name: "Bags", productNumber: "130 Product"),
        CategoryModel(image: "category/icon-4", name: "Shoese", productNumber: "100 Product"),
        CategoryModel(image: "category/icon-6", name: "Electronics", productNumber: "190 Product"),
        CategoryModel(image: "category/icon-5", name: "Jewelry", productNumber: "80 Product")
    ]
    
    static let mockData2 = [
        CategoryModel(image: "category2/image-1", name: "New Arrivals", productNumber: "208 Product"),
        CategoryModel(image: "category2/image-2", name: "Clothes", productNumber: "200 Product"),
        CategoryModel(image: "category2/image-3", name: "Bags", productNumber: "130 Product"),
        CategoryModel(image: "category2/image-4", name: "Shoese", productNumber: "100 Product"),
        CategoryModel(image: "category2/image-5", name: "Dresses", productNumber: "190 Product")
    ]
    
    static let mockData3 = [
        CategoryModel(image: "category3/image-5", name: "New Arrivals", productNumber: "208 Product"),
        CategoryModel(image: "category3/image-6", name: "Clothes", productNumber: "200 Product"),
        CategoryModel(image: "category3/image-10", name: "Bags", productNumber: "130 Product"),
        CategoryModel(image: "category3/image-9", name: "Shoese", productNumber: "100 Product"),
        CategoryModel(image: "category3/image-7", name: "Electronics", productNumber: "190 Product"),
        CategoryModel(image: "category3/image-8", name: "Jewelry", productNumber: "80 Product")
    ]
}
