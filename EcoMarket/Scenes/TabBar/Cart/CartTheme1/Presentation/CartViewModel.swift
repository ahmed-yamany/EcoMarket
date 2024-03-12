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
                    let products: [(Product, CartProduct)] = try await self.productUseCase.getProducts(by: cartProducts) 
                    DispatchQueue.main.async {
                        self.products = products
                    }
                } catch {
                    
                }
            }
        }
        .store(in: &cancellabel)
    }
    
    private func bindPublishers() {
        
    }
}
