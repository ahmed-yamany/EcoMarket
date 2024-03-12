//
//  CartUseCase.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 11/03/2024.
//

import Foundation
import Combine

protocol CartUseCaseProtocol {
    var cart: [CartProduct] { get set}
    var cartPublisher: AnyPublisher<[CartProduct], Never> { get }
    
    func addToCart(_ product: CartProduct) async throws
    func removeFromCart(_ product: CartProduct) async throws
    
    func updateCount(for product: CartProduct, with count: Int)
}
