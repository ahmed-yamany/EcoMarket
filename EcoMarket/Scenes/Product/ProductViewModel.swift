//
//  ProductViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import Foundation
import Combine

public final class ProductViewModel {
    
    // MARK: - Published Properties
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    let coordinator: HomeCoordinatorProtocol
    var productUseCase: ProductRepositories
    let category: String
    private var cancellable: Set<AnyCancellable> = []

    // MARK: - Init
    //
    init(coordinator: HomeCoordinatorProtocol, productUseCase: ProductRepositories, category: String) {
        self.coordinator = coordinator
        self.productUseCase = productUseCase
        self.category = category
        getProducts(by: category)
    }
    // MARK: - Private Methods
    //
    private func getProducts(by category: String) {

        products = productUseCase.getProducts(by: category)
    }
    
    func showDetails(product: Product) {
        coordinator.showDetails(product: product)
    }
}
