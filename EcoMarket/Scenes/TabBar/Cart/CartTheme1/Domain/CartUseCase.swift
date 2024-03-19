//
//  CartUseCase.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 11/03/2024.
//

import Foundation
import Combine

protocol CustomProductUseCaseProtocol {
    var savedProduct: [CustomProductDetails] { get set}
    var savedProductPublisher: AnyPublisher<[CustomProductDetails], Never> { get }
    
    func saveProduct(_ product: CustomProductDetails) async throws
    func removeFromSaved(_ product: CustomProductDetails, fromCart: Bool) async throws
    
    func updateCount(for product: CustomProductDetails?, with count: Int)
}
