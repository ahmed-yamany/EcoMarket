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
    @Published var totalPrice: String = ""
    @Published var cartCount = 0
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
            self.totalPrice = String(products.totalPrice())
            self.cartCount = cartProducts.count
        }
        .store(in: &cancellabel)
    }

    private func bindPublishers() {
        
    }
    
    func removeCartViewModel(_ product: CustomProductDetails) {
        Task {
            do {
                try await cartUseCase.removeFromSaved(product, fromCart: true)
            } catch {
                print("error in removeCartViewModel from CartViewModel ")
            }
        }
    }
    
    func updateCount(for product: CustomProductDetails?, with count: Int) {
        cartUseCase.updateCount(for: product, with: count)
    }
}

extension Array where Element == (Product, CustomProductDetails) {
    func totalPrice() -> Double {
        map {$0.0.price * Double($0.1.count)}.reduce(0, +)
    }
}
