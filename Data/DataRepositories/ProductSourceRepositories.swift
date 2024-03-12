//
//  ProductSourceRepositories.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import Foundation
import Combine

class ProductSourceRepositories: ObservableObject {
    @Published private var products: [ProductSource] = []
    
    init() {
        updateProductsSource()
    }
    private func updateProductsSource () {
        products = JSONDecoder().decode(forResource: "ProductSource") ?? []
    }
    
    func getProductsSource() -> AnyPublisher<[ProductSource], Never> {
        return $products.eraseToAnyPublisher()
    }
        
}
