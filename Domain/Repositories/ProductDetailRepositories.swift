//
//  ProductDetailRepositories.swift
//  EcoMarket
//
//  Created by Hassan on 25/02/2024.
//

import UIKit
import Combine
protocol ProductDetailRepositories {
    func fetchProductDetail(by id: String)
    func getProductDetail() -> AnyPublisher<ProductDetail, Never>
    func getAvilableSizes() -> AnyPublisher<[ProductSizes], Never>
    func getAvilableColors (forSize selectedSize: ProductSizes) -> AnyPublisher<[UIColor], Never>
    func getMaxAvilableProducts(size: ProductSizes, color: UIColor) -> AnyPublisher<Int, Never>
    func addToCart(
        productId: String,
        count: Int,
        selectedColor: UIColor,
        selectedSize: ProductSizes
    ) async throws
    
    func addToWishList(
        productId: String,
        count: Int,
        selectedColor: UIColor,
        selectedSize: ProductSizes
    ) async throws
    var cartCount: AnyPublisher<Int, Never> { get set }
}
