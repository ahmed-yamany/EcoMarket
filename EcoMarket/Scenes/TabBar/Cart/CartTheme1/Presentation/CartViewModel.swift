//
//  CartViewModel.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 11/03/2024.
//

import Foundation
import Combine

class CartViewModel {
    @Published var products: [(Product, CustomProductDetails)] = []
    
    var cancellabel = Set<AnyCancellable>()
    
    let cartUseCase: CustomProductUseCaseProtocol
    let productUseCase: ProductRepositories
    let coordinator: CartCoordinatorProtocol
    
    init(
        cartUseCase: CustomProductUseCaseProtocol,
        coordinator: CartCoordinatorProtocol,
        productUseCase: ProductRepositories
    ) {
        self.cartUseCase = cartUseCase
        self.coordinator = coordinator
        self.productUseCase = productUseCase
    }
    
    func viewDidLoad() {
        cartUseCase.savedProductPublisher.sink { [weak self] cartProducts in
            guard let self = self else { return }
            
            let products: [(Product, CustomProductDetails)] =  self.productUseCase
                .getProducts(by: cartProducts)
                .filter({ $0.1.inCart })
            self.products = products
            
        }
        .store(in: &cancellabel)
    }

    private func bindPublishers() {
        
    }
}
