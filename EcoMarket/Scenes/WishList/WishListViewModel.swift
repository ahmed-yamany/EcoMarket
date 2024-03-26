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
    let productDetailUseCase: ProductDetailRepositories
    let coordinator: ProfileCoordinatorProtocol
    
    init(
        cartUseCase: CustomProductUseCaseProtocol,
        productUseCase: ProductRepositories,
        productDetailUseCase: ProductDetailRepositories,
        coordinator: ProfileCoordinatorProtocol
    ) {
        self.cartUseCase = cartUseCase
        self.productUseCase = productUseCase
        self.productDetailUseCase = productDetailUseCase
        self.coordinator = coordinator
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
    
    func removeFromWishList(_ product: CustomProductDetails) {
        Task {
            do {
                try await cartUseCase.removeFromSaved(product, fromCart: false)
            } catch {
                print("error in removeFromSaved from WishListViewModel ")
            }
        }
    }
    
    func addToCart(_ product: CustomProductDetails) {
        Task {
            do {
                try await productDetailUseCase.addToCart(productId: product.id, 
                                                         count: product.count,
                                                         selectedColor: product.selectedColor,
                                                         selectedSize: product.selectedSize)
                
                coordinator.showAlert(item: .init(message: "Added To Cart",
                                                  buttonTitle: "Ok",
                                                  image: .success,
                                                  status: .success))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
