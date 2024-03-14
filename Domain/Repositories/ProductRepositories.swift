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
    func getCategoryCount(category: String) -> Int
    func getProducts(by cartProducts: [CartProduct]) -> [(Product, CartProduct)]
}
