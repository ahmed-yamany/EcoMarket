//
//  CartViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 11/03/2024.
//

import Foundation
import Combine

class CartViewModel {
    @Published var products: [(Product, CartProduct)] = []
    
    var cancellabel = Set<AnyCancellable>()
    
    let cartUseCase: CartUseCaseProtocol
    let productUseCase: ProductRepositories
    let coordinator: CartCoordinatorProtocol
    
    init(
        cartUseCase: CartUseCaseProtocol,
        coordinator: CartCoordinatorProtocol,
        productUseCase: ProductRepositories
    ) {
        self.cartUseCase = cartUseCase
        self.coordinator = coordinator
        self.productUseCase = productUseCase
    }
    
    func viewDidLoad() {
        cartUseCase.cartPublisher.sink { [weak self] cartProducts in
            guard let self = self else { return }
            Task {
                do {
                    let ids = cartProducts.map { $0.productId }
                    let products: [Product] = try await self.productUseCase.getProducts(by: ids)
                    
                    let pairedProducts = Array(zip(products, cartProducts))
                    
                    self.products += pairedProducts
                } catch {
                    
                }
            }
        }
        .store(in: &cancellabel)
    }
    
    private func bindPublishers() {
        
    }
}
