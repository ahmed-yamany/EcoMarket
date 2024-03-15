//
//  WishListUseCase.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/03/2024.
//

import Foundation
import Combine

protocol WishListUseCaseProtocol {
    var wishlist: [Product] { get set}
    var wishlistPublisher: AnyPublisher<[Product], Never> { get }
    
    func addToWishList(_ product: Product) async throws
}
