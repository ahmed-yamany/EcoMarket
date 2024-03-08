//
//  HomeUseCase.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 08/03/2024.
//

import Foundation

protocol HomeUseCaseProtocol: AnyObject {
    func getFeatures() async throws -> [Product]
    func getCategories() async throws -> [String]
    func getProducts(for category: String) async throws -> [Product]
    
}

final class HomeUseCase: HomeUseCaseProtocol {
    private var products: [ProductSource] = JSONDecoder().decode(forResource: "ProductSource") ?? []
    
    func getFeatures() async throws -> [Product] {
        [products.toProducts()[0]]
    }
    
    func getCategories() async throws -> [String] {
        Array(Set(products.map { product in
            product.category.capitalized
        }))
    }
    
    func getProducts(for category: String) async throws -> [Product] {
        products.toProducts().filter { $0.category.lowercased() == category.lowercased()}
    }
    
}
