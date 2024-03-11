//
//  ProductRepositories.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import Foundation
import Combine

protocol ProductRepositories {
    func getCategories() -> AnyPublisher<[String], Never>
    func getProducts(category: String) async throws -> [Product] 
    func getProducts(by ids: [String]) async throws -> [Product]
}
