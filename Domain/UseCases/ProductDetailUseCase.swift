//
//  ProductDetailUseCase.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import Combine
import UIKit

class ProductDetailUseCase: ProductDetailRepositories, ObservableObject {
    
    @Published private var repo = ProductSourceDetailRepositories()
    @Published private var productDetail: ProductDetail = .mockData
    lazy var cartCount: AnyPublisher<Int, Never> = cartUseCase.savedProductPublisher.map {$0.count}.eraseToAnyPublisher()
    let cartUseCase: CustomProductUseCaseProtocol
    init(cartUseCase: CustomProductUseCaseProtocol) {
        self.cartUseCase = cartUseCase
    }
    
    private var cancellables = Set<AnyCancellable>()

    func fetchProductDetail(by id: String) {
        repo.getProductSourceDetail(by: id)
            .map { $0.toProductDetail() }.sink {[weak self] productDetail in
                self?.productDetail = productDetail
            }
            .store(in: &cancellables)
    }
    
    func getProductDetail() -> AnyPublisher<ProductDetail, Never> {
        $productDetail.eraseToAnyPublisher()
    }

    func getAvilableSizes() -> AnyPublisher<[ProductSizes], Never> {
        return $productDetail.map { $0.productAttribute.map {$0.sizes}} .eraseToAnyPublisher()
    }
    
    func getAvilableColors(forSize selectedSize: ProductSizes) -> AnyPublisher<[UIColor], Never> {
        return $productDetail
            .map({$0.productAttribute
                    .first {$0.sizes == selectedSize }
                    .map {$0.colors} ?? []
            })
            .eraseToAnyPublisher()
    }
    
    func getMaxAvilableProducts(size: ProductSizes, color: UIColor) -> AnyPublisher<Int, Never> {
        return $productDetail
              .map { productDetail in
                  guard let sizeAttribute = productDetail.productAttribute
                      .filter({ $0.sizes == size })
                      .first,
                      let colorIndex = sizeAttribute.colors.firstIndex(where: { $0 == color }) else {
                          return 0
                  }
                  return sizeAttribute.avaliableInStok[colorIndex]
              }
              .eraseToAnyPublisher()
    }
    
    func addToCart(productId: String, count: Int, selectedColor: UIColor, selectedSize: ProductSizes) async throws {
        let product = CustomProductDetails(
            productId: productId,
            selectedColor: selectedColor,
            selectedSize: selectedSize,
            count: count,
            isFavorite: false,
            inCart: true
        )
        try await cartUseCase.saveProduct(product)
    }
    
    func addToWishList(productId: String, count: Int, selectedColor: UIColor, selectedSize: ProductSizes) async throws {
        let product = CustomProductDetails(
            productId: productId,
            selectedColor: selectedColor,
            selectedSize: selectedSize,
            count: count,
            isFavorite: true,
            inCart: false
        )
        try await cartUseCase.saveProduct(product)
    }
}
