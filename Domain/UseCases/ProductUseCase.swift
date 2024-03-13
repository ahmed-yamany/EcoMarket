//
//  ProductUseCase.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import Foundation
import Combine

class ProductUseCase: ProductRepositories, ObservableObject {
    
    @Published private var repo = ProductSourceRepositories()
    @Published private var products: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupObserving()
        updateProducts()
    }
    
    private func setupObserving() {
        $products
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    private func updateProducts() {
        repo.getProductsSource()
            .map { $0.toProducts() }
            .assign(to: \.products, on: self)
            .store(in: &cancellables)
    }
    
    func getCategories() -> AnyPublisher<[String], Never> {
        return $products
            .map { products in
                Array(Set(products.map { $0.category.capitalized }))
                    .sorted()
            }
            .eraseToAnyPublisher()
    }
    
    func getProducts(category: String) async throws -> [Product] {
        let filteredProducts = products
            .filter { $0.category.lowercased() == category.lowercased() }
        
        let sortedProducts = filteredProducts.sorted { $0.name < $1.name }
        
        return sortedProducts
    }
    
    func getProducts(by cartProducts: [CartProduct]) -> [(Product, CartProduct)] {
        var results: [(Product, CartProduct)] = []
        for cartProduct in cartProducts {
            for product in products {
                if product.id == cartProduct.productId {
                    results.append((product, cartProduct))
                }
            }
        }
        return results
    }
}
