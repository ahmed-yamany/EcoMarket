//
//  WishListViewModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/03/2024.
//

import Foundation
import Combine

class WishListViewModel {
    @Published var products: [(Product, CustomProductDetails)] = []
    
    var cancellabel = Set<AnyCancellable>()
    
    let cartUseCase: CustomProductUseCaseProtocol
    let productUseCase: ProductRepositories
    
    init(
        cartUseCase: CustomProductUseCaseProtocol,
        productUseCase: ProductRepositories
    ) {
        self.cartUseCase = cartUseCase
        self.productUseCase = productUseCase
    }
    
    func viewDidLoad() {
        cartUseCase.savedProductPublisher.sink { [weak self] cartProducts in
            guard let self = self else { return }
            
            let products: [(Product, CustomProductDetails)] =  self.productUseCase
                .getProducts(by: cartProducts)
                .filter({ $0.1.isFavorite })
            self.products = products
            
        }
        .store(in: &cancellabel)
    }
}
