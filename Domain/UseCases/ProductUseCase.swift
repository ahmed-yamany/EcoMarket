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
            .sink { [weak self] products in
                self?.products = products
            }
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
    
    func getProducts(category: String) -> AnyPublisher<[String: [Product]], Never> {
        return $products
            .map { products in
                Dictionary(grouping: products, by: { $0.category.capitalized })
                    .mapValues { products in
                        products.sorted { $0.name < $1.name }
                    }
            }
            .eraseToAnyPublisher()
    }
}
